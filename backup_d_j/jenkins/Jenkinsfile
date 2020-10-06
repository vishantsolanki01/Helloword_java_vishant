pipeline {
   agent any

   stages {
      stage('Build') {
         steps {
            sh './jenkins/build.sh'
         }
      }
      stage('Create Docker Image') {
         steps {
            sh './jenkins/build_docker_image.sh'
         }
      }
      stage('Push Docker Image') {
         environment {
                SERVICE_CREDS = credentials('dckerhub')
         }
         steps {
            sh "docker login --username=$SERVICE_CREDS_USR --password=$SERVICE_CREDS_PSW";
            sh "docker image push coolgourav147/javaproject:${BUILD_ID}";
	    sh "docker image rm coolgourav147/javaproject:${BUILD_ID}"
         }
      }
      stage('Testing') {
         steps {
            echo 'Unit Testing'
         }
      }
      stage('Deploy on Testing Environment') {
         steps {
            sh "docker service create --with-registry-auth --name javaproject -d -p 8000:8080 coolgourav147/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=coolgourav147/javaproject:${BUILD_ID} javaproject"
         }
      }
      stage('Deploy on Staging Environment') {
         steps {
            sh 'docker context use staging'
            sh "docker service create --with-registry-auth --name javaproject -d -p 8000:8080 coolgourav147/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=coolgourav147/javaproject:${BUILD_ID} javaproject"
         }
      }
      stage('Deploy on Production Environment') {
         steps {
	    sh 'docker context use prod'
            sh "docker service create --with-registry-auth --name javaproject -d -p 8000:8080 coolgourav147/javaproject:${BUILD_ID} || docker service update --with-registry-auth --image=coolgourav147/javaproject:${BUILD_ID} javaproject"
            echo 'Production Environment'
         }
      }
   }
   post { 
        always { 
            sh 'docker context use default'
        }
    }
}
