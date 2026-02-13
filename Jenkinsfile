pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.5'
            args '--entrypoint=""'
        }
    }
    parameters {
        choice(name: 'action', choices: ['select', 'apply', 'destroy'], description: 'Terraform action')
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