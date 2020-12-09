pipeline {
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev','qa','stage'], description: 'Select Environment to delete /app/tmp/kafka-streams/')
        choice(name: 'APP', choices: ['depot-smoothing','input-acl','stock-sharing'], description: 'Select Environment to delete /app/tmp/kafka-streams/')
    }
    options {
        buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '30'))
        disableConcurrentBuilds()
    }

    agent {
        node {
            label 'StoreOrderOptimiser'
        }
    }

    stages {
         stage('Delete State Store Directories') {
            steps {
                script {
                    echo "Getting server list"
                    sh '/appl/scripts/delete_state_store.sh -a $APP -e $ENVIRONMENT'
                }
            }
        }
    }
}
