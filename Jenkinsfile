
// Declarative pipeline for multibranch for DEV Branch

pipeline {
    // agent { label 'Master' }
    agent any

    tools { // To define tools's specific version if multiple versions are installed and/or to install tools and set environment path on JK machine/Nodes automatically if not already done (Defining tools{} make pipeline portable)
        maven 'Maven 3.8.7' // 'Maven 3.8.7' label is defined in tools setting for Maven installation
        jdk 'Java 17.0.15'
}
// parameters {
//       string ( name: 'GIT_BRANCH', defaultValue: 'main', description: 'Git branch to build')
//       }

    environment { // To define global(pipeline) level variables
        //     GIT_REPO = 'https://github.com/abasimdev/spring-petclinic.git'
        //    // GIT_BRANCH = 'main' // master
        SONARQUBE = 'sonar-scanner' //SonarQube Server ID in JK System settings
    }
    stages {
        // stage('Checkout') {
        //     // agent { label 'Master' } // Run this stage on any other node/agent
        //     steps {
        //         // git branch: "${params.GIT_BRANCH}", url: "${GIT_REPO}"
        //         checkout scm //This is for multibranch
        //     }
        // }
        stage('Unit Tests') { // Perform Unit tests after compile and before the build stage.
            steps {
                echo 'Performing Unit Testing using Junit'
                sh 'mvn test'
            }
            post {
                always { // Wether unit tests pass or fail always archive the test results
                    junit keepProperties: true, skipMarkingBuildUnstable: true, stdioRetention: 'ALL', testResults: 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                //catchError cotinues the pipleine execution despite of this stage passes or fails
                catchError(buildResult: 'SUCCESS', message: 'The SonarQube stage is :', stageResult: 'FAILURE') {
                    withSonarQubeEnv("${SONARQUBE}") {
                        sh 'Running SonarQube stage that might fail because of the missing server details'
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }
        stage('Build') {
            // agent{ docker{ image 'maven:3.8.6-jdk-17' } } // Run this stage on a Docker container
            steps {
                echo 'Building Application Package for Branch: {env.BRANCH_NAME}'
                sh 'mvn package'
            }
        }
    }
    post {
        always {
            echo '========always========'
            echo "Branch: ${env.BRANCH_NAME}"
        }
        success {
            echo '========pipeline executed successfully ========'
            echo "Branch: ${env.BRANCH_NAME}"
        }
        failure {
            echo '========pipeline execution failed========'
            echo "Branch: ${env.BRANCH_NAME}"
        }
    }
}
