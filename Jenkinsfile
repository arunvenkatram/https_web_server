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

    stage('test') {
      parallel {
        stage('test') {
          steps {
            sh 'echo \'this is test 1 stage\''
            sh 'echo \'this is test 1.1 stage\''
          }
        }

        stage('test2') {
          steps {
            sh 'echo \'this is test 2 stage\''
          }
        }

      }
    }

    stage('deployment') {
      steps {
        sh 'echo \'this is deployment stage\''
      }
    }
        stage("Trigger depotsmoothing and stocksharing build") {
            // when {
            //     branch 'master'
            // }
            parallel {
                stage("Trigger DSS") {
                    steps {
                        echo "Triggering DSS"
                        build ( 
                            job: "optimisation-depotsmoothing-service/master",
                            propagate:true,
                            wait:true )
                    }
                }
                stage("Trigger SSS") {
                    steps {
                        echo "Triggering SSS"
                        build (
                            job: "optimisation-stocksharing-service/master",
                            propagate: true,
                            wait: true )
                    }
                }
            }
        }

  }
}
