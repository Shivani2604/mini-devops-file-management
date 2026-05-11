pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Shivani2604/mini-devops-file-management.git'
            }
        }

        stage('Run PowerShell Script') {
            steps {
                powershell './scripts/file-management.ps1'
            }
        }

        stage('Show Report') {
            steps {
                powershell 'Get-Content Reports/report.txt'
            }
        }
    }
}