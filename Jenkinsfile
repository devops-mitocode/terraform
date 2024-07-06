pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.9.1'
            args '--entrypoint=""'
        }
    }
    parameters{
        choice(name: 'action', choices: ['select', 'apply', 'destroy'], description: 'Terraform action')
    }
    stages {
        stage('init') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }
        stage('apply') {
            when {
                expression {
                    return params.action == 'apply'
                }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('destroy') {
            when {
                expression {
                    return params.action == 'destroy'
                }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
