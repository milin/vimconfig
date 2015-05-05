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


export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/dbhome_1/lib:/opt/mqm/lib64
export DEPLOY_ENVIRONMENT=dev_local
export IBM_DB_HOME=/home/db2inst1/sqllib/lib
# Bad things will happen if you source db2profile in zshrc
#source /home/db2inst1/sqllib/db2profile
#
#My Aliases
alias dtplatform='cd /home/vagrant/development/dt/dtplatform'
alias dtweb='cd /home/vagrant/development/dt/dtweb'
alias personal='cd /home/vagrant/development/personal'
alias dtbase='cd /home/vagrant/development/dt-django-base/dt_django_base'
alias dtmaster='cd /home/vagrant/development/dtmaster'
# Personal Projects
alias faceguard='cd /home/vagrant/development/personal/faceguard'

# ssh aliases
alias sshdevint1='sshpass -p "changeme" ssh qauser@10.136.0.11'
alias sshdevint2='sshpass -p "changeme" ssh qauser@10.136.0.12'
alias sshdjbs1='sshpass -p DTpass11 ssh root@10.134.25.99'
alias sshdjbs1='sshpass -p DTpass11 ssh root@10.134.25.99'
alias sshdjbs3='sshpass -p DTpass11 ssh root@10.134.25.58'
#Customize to your needs...
#
stty -ixon

# Nosetest X
alias nosetestsx='nosetests -v 2> somefile; less somefile | fpp; sudo rm somefile'


export DJANGO_SETTINGS_MODULE=dtweb.settings.dev_local
