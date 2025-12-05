pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.14.1'
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