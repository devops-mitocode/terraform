pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.9.5'
            args '--entrypoint=""'
        }
    }
    parameters{
        choice(name: 'action', choices: ['select', 'apply', 'destroy'], description: 'Terraform action')
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform -help'
            }
        }
    }
}