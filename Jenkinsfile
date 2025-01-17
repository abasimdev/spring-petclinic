pipeline{
    agent any
    stages{
                        parameters {
                    booleanParam defaultValue: true, description: 'Do you want to clean older packages?', name: 'mvn_clean'
                }
        stage("Checkout"){
            steps{
                git branch: 'ab/pipeline', url: 'https://github.com/abasimdev/spring-petclinic.git'
            }
        }
        stage("Build"){
            steps{

                script{
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
}

