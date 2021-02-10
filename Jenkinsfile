pipeline {
  agent any
  stages {
    stage('build1') {
      parallel {
        stage('build1') {
          steps {
            sh 'echo \'this is build 1 stage\''
            sh 'echo \'this is build 1.1 stage\''
          }
        }

        stage('build2') {
          steps {
            echo 'this is build 2 stage'
            sh 'echo \'this is build 2.2 stage\''
          }
        }

      }
    }

    stage('deployment') {
      steps {
        sh '''for TOPIC in $(echo "df e fw erf ef segewrg erg")
                    

do
                    
                    echo "Topic ${TOPIC} deleted"
                    done'''
        sh 'echo "lets see if it works"'
      }
    }

  }
}