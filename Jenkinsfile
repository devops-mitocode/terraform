pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.5'
            args '--entrypoint=""'
        }
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform --version'
            }
        }
    }
}