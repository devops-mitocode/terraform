pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.13'
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