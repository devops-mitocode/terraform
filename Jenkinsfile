pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.10.5'
            args '--entrypoint=""'
        }
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform --version'
                sh 'env | sort'
            }
        }
    }
}