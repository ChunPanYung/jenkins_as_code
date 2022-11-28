pipeline {
    agent any

    triggers {}

    parameters {}

    stages {
        stage('Update all docker images...') {
            steps {
                sh '''#!/bin/bash
                    images=$(docker images --format "{{.Repository}}:{{.Tag}}")
                    images=$($images | grep --invert-match --extended-regexp '<none>|local')

                    for image in $images
                    do
                      docker pull $image
                    done
                '''
            }
        } // End stage('Update')
        stage('Prune all unused docker images...') {
            steps {
                sh '''#!/bin/bash
                    docker image prune
                '''
            }
        } // End stage('Update')
    } // End stages
    post {
        always {
            echo 'List all docker images...'
            sh 'docker images'
        }
    }
}
