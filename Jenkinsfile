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
                parameters {
                    booleanParam defaultValue: true, description: 'Do you want to clean older packages?', name: 'mvn_clean'
                }
                if (mvn_clean == true){
                sh 'mvn clean package'
                }
                else{
                    sh 'mvn package'
                }
            }
        }
    }
}

