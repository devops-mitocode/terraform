pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.5'
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