pipeline {
    agent { label 'agent-01' }

    environment {
        PROX_TOKEN_ID = "${PROX_TOKEN_ID}"
    }

    parameters {
		choice (name: 'JOB_TYPE', choices: ['create-vm', 'deploy-k8s', 'deploy-k8s-cluster'], description: 'Select deployment type')
    }

    stages {
        stage('Creating Virtual Machine') {
	    when {
			expression {params.JOB_TYPE == 'create-vm'}
	    }
            steps {
				echo "*** Creating virtual machine ***"
				maskPasswords(varPasswordPairs: [[var: '${env.PROX_TOKEN_ID}']], varMaskRegexes: []) {
					sh "ansible-playbook playbook/create-vm.yml -e \'api_token_secret=${env.PROX_TOKEN_ID}\'"
				}
				echo '*** Virtual machine provisioned ***'
				echo '*** Proceed to login via SSH ***'
            }
        }
        stage('Deploy K8s') {
	    when {
			expression {params.JOB_TYPE == 'deploy-k8s'}
	    }
            steps {
				echo "*** Deploying K8s cluster ***"
				maskPasswords(varPasswordPairs: [[var: '${env.PROX_TOKEN_ID}']], varMaskRegexes: []) {
					sh "ansible-playbook playbook/deploy-k8s.yml -e \'api_token_secret=${env.PROX_TOKEN_ID}\'"
				}
				echo '*** Cluster initialized, proceed to join worker in the cluster ***'
            }
        }
        stage('Deploy K8s Cluster') {
	    when {
			expression {params.JOB_TYPE == 'deploy-k8s-cluster'}
	    }
            steps {
				echo "*** Deploying K8s cluster ***"
				maskPasswords(varPasswordPairs: [[var: '${env.PROX_TOKEN_ID}']], varMaskRegexes: []) {
					sh "ansible-playbook playbook/deploy-k8s-cluster.yml -e \'api_token_secret=${env.PROX_TOKEN_ID}\'"
				}
				echo '*** Cluster initialized, proceed to join worker in the cluster ***'
            }
        }
    }
}
