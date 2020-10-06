pipeline {
   agent any

   stages {
      stage('Build') {
         steps {
            sh './jenkins/build.sh'
         }
      }
      stage('Store Jar file in Repositrory') {
         steps {
            rtUpload (
               serverId: 'localarticatory',
               spec: '''{
                   "files": [
                      {
                           "pattern": "**/*.jar",
                           "target": "generic-local/${BUILD_ID}/"
                      }
                  ]
             }''')
         }
      }
      stage('Create Docker Image') {
         steps {
           echo "create Docker Image"
         }
      }
      stage('Push Docker Image') {
         steps {
            echo "push docker image"
         }
      }
      stage('Testing') {
         steps {
            sh 'docker container run --rm -v $(pwd):/app -w /app maven:3-jdk-11 mvn test'
         }
      }
      stage('Deploy on Testing Environment') {
         steps {
           echo "Deploy in Testing"
         }
      }
      stage('Deploy on Staging Environment') {
         steps {
           echo "Deploy in Staging Env"
         }
      }
      stage('Deploy on Production Environment') {
         steps {
            echo 'Production Environment'
         }
      }
   }
   post { 
        always { 
            sh 'echo always run'
        }
    }
}
