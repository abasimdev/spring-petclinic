pipeline{
    agent any
    stages{
        stage("Checkout"){
            steps{
                git branch: 'ab/pipeline', url: 'https://github.com/abasimdev/spring-petclinic.git'
            }
        }
        stage("Build"){
            steps{
                sh 'mvn clean package'
            }
        }
    }
}