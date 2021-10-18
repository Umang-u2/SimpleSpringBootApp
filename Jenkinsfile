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
            node {
        		checkout scm
    			docker.withRegistry('https://hub.docker.com/repository/docker/upadhuma/simple-project', 'dockerhubCreds') {
        		def customImage = docker.build("umang-u2/dockerwebapp")
        		customImage.push()
        			}
        		}
    }
}