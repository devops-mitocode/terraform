pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.11.4'
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
