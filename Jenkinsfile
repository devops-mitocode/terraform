pipeline {
    agent {
        docker {
            image 'maven:3.8.8-eclipse-temurin-17-alpine'
        }
    }
    stages {
        stage('Package') {
            steps {
                sh 'env | sort'
            }
        }     
    }   
}
