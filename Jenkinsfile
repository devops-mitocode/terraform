pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.9.5'
            args '--entrypoint=""'
        }
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform -help'
            }
        }
    }
}