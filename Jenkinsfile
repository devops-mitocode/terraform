pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.7.4'
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