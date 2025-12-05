pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.1'
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