#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/dbhome_1/lib
export DEPLOY_ENVIRONMENT=dev_local
export IBM_DB_HOME=/home/db2inst1/sqllib/lib
#source /home/db2inst1/sqllib/db2profile
alias dtplatform='cd /home/vagrant/development/dt/dtplatform'
alias dtweb='cd /home/vagrant/development/dt/dtweb'

 #Customize to your needs...
