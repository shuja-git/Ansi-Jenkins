pipeline{
    agent any
    parameters {
     choice(name: 'ENV', choices: ['DEV', 'PROD'], description: 'choose env')
    string(name: 'COMPONENT', defaultValue: '', description: 'Which app component?')
    }
    stages {
        stage('create server'){
            steps {
                sh 'bash eec2-launch.sh ${COMPONENT}'
            }
        }
        stage('Ansible Playbook run') {
            steps {
            script {
                env.ANSIBLE_TAG=COMPONENT.toUpperCase()
             }
                sh 'ansible-playbook -i rroboshop.inv rroboshop.yml -e ENV=${ENV} -t ${ANSIBLE_TAG}'
            }
        }
    }
}