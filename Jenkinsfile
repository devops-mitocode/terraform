pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.7.4'
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