pipeline{
    agent { label 'JENKINSNODE'}
    parameters {
     choice(name: 'ENV', choices: ['DEV', 'PROD'], description: 'choose env')
    string(name: 'COMPONENT', defaultValue: '', description: 'Which app component?')
    }
    stages {
        stage('create server'){
            steps {
                sh 'bash ec2-launch.sh ${COMPONENT} ${ENV}'
            }
        }
        stage('Ansible Playbook run') {
            steps {
            script {
                env.ANSIBLE_TAG=COMPONENT.toUpperCase()
             }
                sh 'sleep 60'
                sh 'ansible-playbook -i roboshop.inv roboshop.yml -e ENV=${ENV} -t ${ANSIBLE_TAG}'
            }
        }
    }
}