pipeline{
    agent any
          parameters {
                    booleanParam defaultValue: true, description: 'Do you want to clean older packages?', name: mvn_clean
                }
    stages{
                  
        stage("Checkout"){
            steps{
                git branch: 'ab/pipeline', url: 'https://github.com/abasimdev/spring-petclinic.git'
            }
        }
        stage("Build"){
            steps{

                script{
                if (${mvn_clean} == true){
                sh 'mvn clean package'
                echo "Performed Full build"
                }
                else{
                    sh 'mvn package'

echo "Performed Basic build"
                }
                }
            }
        }
    }
}

