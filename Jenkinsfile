pipeline {
    agent { dockerfile true }
    tools {
        maven 'maven-3.5.0'
    }

    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
        stage ('SCM Checkout'){
        	steps {
        	git credentialsId: 'gitCredentials', url: 'https://github.com/Umang-u2/SimpleSpringBootApp.git'
        	}
        }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                    success {
                        junit 'target/surefire-reports/**/*.xml'
                        }
                 }
            }
       stage ('Build Docker Image'){
			steps {
				sh 'docker build -t upadhuma/simple-project'
			}       		
       }
    }
}