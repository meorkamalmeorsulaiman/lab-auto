pipeline {
    agent { label 'agnt-01' }

    environment {
        PROX_TOKEN_ID = "${PROX_TOKEN_ID}"
    }

    parameters {
	choice (name: 'JOB_TYPE', choices: ['create-vm', 'deploy-k8s'], description: 'Select deployment type')
    
    }

    stages {
        stage('Creating Virtual Machine') {
            steps {
				echo "*** Creating virtual machine ***"
				maskPasswords(varPasswordPairs: [[var: '${env.PROX_TOKEN_ID}']], varMaskRegexes: []) {
					sh "ansible-playbook playbook/create-vm.yml -e \'api_token_secret=${env.PROX_TOKEN_ID}\'"
				}
				echo '*** Virtual machine provisioned ***'
				echo '*** Proceed to login via SSH ***'
            }
        }
    }
}
