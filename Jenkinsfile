pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.5'
            args '--entrypoint=""'
        }
    }
    options {
        ansiColor('xterm')
    }    
    parameters {
        choice(name: 'action', choices: ['select', 'apply', 'destroy'], description: 'Terraform action')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_REGION = 'us-west-2'
    }    
    stages {
        stage('init') {
            steps {
                sh 'env | sort'
                sh 'terraform init'
            }
        }
        stage('apply') {
            when {
                expression { params.action == 'apply' }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('destroy') {
            when {
                expression { params.action == 'destroy' }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}