pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t file-management-app .'
            }
        }

        stage('Remove Old Container') {
            steps {
                bat 'docker rm -f file-container || exit 0'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run --name file-container file-management-app'
            }
        }

        stage('Show Containers') {
            steps {
                bat 'docker ps -a'
            }
        }
    }
}