pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Shivani2604/mini-devops-file-management.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t file-management-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run --name file-container file-management-app'
            }
        }

        stage('Show Running Containers') {
            steps {
                bat 'docker ps -a'
            }
        }
    }
}