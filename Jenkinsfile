pipeline {
   agent any

   stages {
      stage('MAVEN_BUILD') {
         steps {
            sh './java_project_6oct2020/jenkins/build.sh'
         }
      }

    stage('DOCKER_IMAGE_BUILD') {
         steps {
            sh './java_project_6oct2020/jenkins/build_docker_image.sh'
         }
      }  
    stage('DOCKER_IMAGE_PUSH') {
        environment {
                SERVICE_CREDS = credentials(dockerhub)
            }
         steps {
            sh "docker login --username=$SERVICE_CREDS_USR  --password=$SERVICE_CREDS_PSW";
            sh "docker image push vishantsolanki01/javaproject:${build_id}";
            sh "docker image rm vishantsolanki01/javaproject:${build_id}"
         }
      } 

    stage('UNIT_TESTING') {
         steps {
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${build_id} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${build_id} javaproject'
         }
      } 

    stage('DEPLOY_CODE_STAGING') {
         steps {
            sh 'docker context use staging' 
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${build_id} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${build_id} javaproject'
         }
      } 

    stage('DEPLOY_CODE_PRODUCTION') {
         steps {
            sh 'docker context use production' 
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${build_id} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${build_id} javaproject'
         }
      }             
   }

   post {
       always{

           sh 'docker context use default'
       }
   }
}

