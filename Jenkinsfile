pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.10.5'
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