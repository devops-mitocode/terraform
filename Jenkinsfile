pipeline{
    agent none
    parameters{
        choice(
            choices: ['select', 'apply', 'destroy'],
            description: 'Terraform action',
            name: 'action')
    }
    stages{
        stage("terraform apply"){
            when{
                expression { params.action == 'apply' }
            }
            agent{
                docker {
                    image 'hashicorp/terraform:1.7.4'
                    args '--entrypoint=""'
                }
            }
            environment{
                AWS_ACCESS_KEY_ID = credentials('aws-access-key')
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
                AWS_DEFAULT_REGION = 'us-west-2'
            }
            steps{
                sh 'terraform init'
                sh 'terraform apply -auto-approve'

                script{
                    def ec2InstanceIp = sh(script: "terraform output -raw ec2_instance_ip", returnStdout: true).trim()
                    writeFile file: 'ec2_instance_ip', text: "${ec2InstanceIp}"
                }
            }
            post{
                success{
                    archiveArtifacts artifacts: 'ec2_instance_ip', onlyIfSuccessful: true
                }
            }
        }
        stage("ansible-playbook"){
            when{
                expression { params.action == 'apply' }
            }
            options { skipDefaultCheckout() }
            agent{
                docker {
                    image 'quay.io/ansible/ansible-runner:stable-2.12-latest'
                    args "-u root"
                }
            }
            environment {
                ANSIBLE_HOST_KEY_CHECKING = "False"
            }
            steps{
                
                script{
                    def ec2InstanceIp = readFile 'ec2_instance_ip'
                    writeFile file: 'hosts', text: "[servers]\nserver1 ansible_host=${ec2InstanceIp}"
                }
                
                sh 'cat hosts'
                sh 'ansible --version'

                sshagent(credentials: ['centos-private-key']) {

                    waitUntil {
                        script {
                            try {
                                sh 'ansible-playbook -i hosts ansible/playbooks/server1_config.yml'
                                return true
                            } catch (Exception e) {
                                echo 'ansible-playbook failed'
                                sleep(time: 20, unit: "SECONDS")
                                return false
                            }
                        }
                    }
                }
            }
        }
        stage("terraform destroy"){
            when{
                expression { params.action == 'destroy' }
            }
            options { skipDefaultCheckout() }
            agent{
                docker {
                    image 'hashicorp/terraform:1.6.3'
                    args '--entrypoint=""'
                }
            }
            environment{
                AWS_ACCESS_KEY_ID = credentials('aws-access-key')
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
                AWS_DEFAULT_REGION = 'us-west-2'
            }
            steps{
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}