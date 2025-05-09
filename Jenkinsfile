pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.11.4'
            args '--entrypoint=""'
        }
    }
    parameters {
        choice(name: 'action', choices: ['select', 'apply', 'destroy'], description: 'Terraform action')
    }    
    stages {
        stage('terraform') {
            steps {
                sh 'terraform --version'
            }
        }     
    }   
}
