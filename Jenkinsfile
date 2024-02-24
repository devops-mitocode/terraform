pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.7.4'
            args '--entrypoint=""'
        }
    }
    parameters{
        choice(
            choices: ['select', 'apply', 'destroy'],
            description: 'Terraform action',
            name: 'action')
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform --version'
            }
        }
    }
}