pipeline {
    agent any

    stages {
        stage('Update') {
            steps {
                echo 'Update all Docker Images...'
                sh '''#!/bin/bash
                    for image in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep -v '<none>')
                    do
                      docker pull $image
                    done
                '''
                echo 'Finished update all Docker Images.'
            }
        } // End stage('Update')
    }
}
