pipeline {
   agent any

   stages {
      stage('MAVEN_BUILD') {
         steps {
            sh './jenkins/build.sh'
         }
      }

    stage('DOCKER_IMAGE_BUILD') {
         steps {
            sh './jenkins/build_docker_image.sh'
         }
      }  
    stage('DOCKER_IMAGE_PUSH') {
          environment {
                SERVICE_CREDS = credentials('dockerid')
         }
         steps {
            sh "docker login --username=$SERVICE_CREDS_USR --password=$SERVICE_CREDS_PSW";
            sh "docker image push vishantsolanki01/javaproject:${BUILD_ID}";
            sh "docker image rm vishantsolanki01/javaproject:${BUILD_ID}"
         }
      } 

    stage('UNIT_TESTING') {
         steps {
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${BUILD_ID} javaproject'
         }
      } 

    stage('DEPLOY_CODE_STAGING') {
         steps {
            sh 'docker context use staging' 
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${BUILD_ID} javaproject'
         }
      } 

    stage('DEPLOY_CODE_PRODUCTION') {
         steps {
            sh 'docker context use production' 
            sh 'docker service create --with-registry-auth --name=javaproject -d -p 8000:8080 vishantsolanki01/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=vishantsolanki01/javaproject:${BUILD_ID} javaproject'
         }
      }             
   }

   post {
       always{

           sh 'docker context use default'
       }
   }
}

