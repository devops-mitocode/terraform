pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.10.5'
            args '--entrypoint=""'
        }
    }
    environment {
        AWS_ACCESS_KEY_ID = 'aa'
        AWS_SECRET_ACCESS_KEY = 'bb'
        AWS_DEFAULT_REGION = 'us-west-2'
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