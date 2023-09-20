pipeline {
    agent any

 

    environment {
        PATH = "$PATH:/usr/bin/node"
    }

 

    stages {
        stage('GetCode') {
            steps {
                git branch: 'master', url: 'https://github.com/giridharpatnaik183/LdTech-DevApp.git'
            }
        }

 

        stage('Build') {
            steps {
                sh 'npm i react-scripts'
            }
        }

 

        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh "npm install sonar-scanner"
                    sh "npm run sonar-scanner"
                }
            }
        }

 

        stage('Deploy Docker Container') {
            steps {
                script {

                    sh 'docker-compose -f docker-compose.dev.yml up -d'
                }
            }
        }
    }
}
