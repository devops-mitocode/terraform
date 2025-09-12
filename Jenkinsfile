pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.13'
            args '--entrypoint=""'
        }
    }
    stages {
        stage('Artifactory') {
            steps {
                sh 'terraform --version'
            }
        }                
    }
}