# .bashrc
# Git memo
#
# Commit
#   git commit -m "..."  .
#   git push origin master
#
# Uncommit
#   git reset   HEAD~
#   git rebase  HEAD~
#
# Put tag
#   git tag  0.0.1
#   git push --tags
#
# Untag
#   git tag  -d 0.0.1
#   git push  origin :refs/tags/0.0.1
#
# Move to the branch
#   ( git stash save branch-name )
#   ( git stash list )
#   ( git stash pop 'stash@{0}')
#   git checkout branch-name
#   git checkout branch-name -t 0.0.1
#
# Checkout remote branch to temporary local branch
#   git branch tmp origin/master
#   git checkout tmp
#    or
#   git checkout -b tmp origin/master
#
# Delete the branch
#   git branch -d branch-name
#


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="[\h \u:\w]\\$ "
#-----------------
# LANG
export LC_ALL=ja_JP.utf8
export LANG=ja_JP.utf8
export LANGAGE=ja_JP.utf8
export EDITOR=vim
#-----------------
# Bash completion
export BASH_COMPLETION=~/workenv/bash_completion
export BASH_COMPLETION_DIR=~/workenv/bash_completion.d
export BASH_COMPLETION_COMPAT_DIR=/workenv/bash_completion.d
if [ -f $BASH_COMPLETION ]; then
    . $BASH_COMPLETION
fi
export GIT_COMPLETION=/workenv/git/contrib/completion/git-completion.bash
if [ -f $GIT_COMPLETION ]; then
    . $GIT_COMPLETION
fi

#-----------------
# SSH-AGENT
#S_LINK_AUTH_SOCK=~/.ssh/auth_sock
#if [ $SSH_AUTH_SOCK ]; then
#    S_LINK_AUTH_SOCK_DATE=`ls -d -l --time-style='+%Y%m%d' ${S_LINK_AUTH_SOCK}  | awk '{print $6}'`
#    TODAY=`date +'%Y%m%d'`
#    if [ ! -L $S_LINK_AUTH_SOCK ] || [ ! -S `readlink $S_LINK_AUTH_SOCK` ] || [ ! "${TODAY}" = "${S_LINK_AUTH_SOCK_DATE}" ]; then
#	rm -f $S_LINK_AUTH_SOCK
#	ln -s $SSH_AUTH_SOCK $S_LINK_AUTH_SOCK
#    fi
#fi
#export SSH_AUTH_SOCK=$S_LINK_AUTH_SOCK
# History
export HISTSIZE=100000
export HISTFILESIZE=100000
#-----------------
# http_proxy
if [ -f ~/etc/proxy ]; then
    . proxy
fi
#-----------------
# tsocks
export TSOCKS_CONF_FILE=~/env/tsocks.conf

#-----------
# python
#export PYTHON_HOME=/usr/local/python-2.6.6
#export PATH=${PYTHON_HOME}/bin:${PATH}
#-----------
# php
#export PHP_HOME=/usr/local/php
#export PATH=${PHP_HOME}/bin:${PATH}
#-----------
# java
#export JAVA_HOME=/usr/java/jdk
#export PATH=${JAVA_HOME}/bin:${PATH}
#export HADOOP_HOME=/usr/local/hadoop
#export PATH=${HADOOP_HOME}/bin:${PATH}
#export MAHOUT_HOME=/usr/local/mahout
#export PATH=${MAHOUT_HOME}/bin:${PATH}
#-----------
# ant
#export ANT_HOME=/usr/local/apache-ant
#export PATH=${ANT_HOME}/bin:${PATH}
#export MANPATH=${ANT_HOME}/man:$MANPATH
#-----------
# mvn
#  mvn install:install-file -DgroupId=org.apache.lucene -DartifactId=lucene-gosen-ipdic -Dversion=2.0.2 -Dpackaging=jar -Dfile=lucene-gosen-2.0.2-ipadic.jar
#  mvn archetype:create -DgroupId=jp.crumb -DartifactId=sample-web -DarchetypeArtifactId=maven-archetype-webapp
#  mvn archetype:create -DgroupId=jp.crumb -DartifactId=sample-jar -DarchetypeArtifactId=maven-archetype-quickstart
#  mvn eclipse:eclipse
#  mvn dependency:copy-dependencies
#  mvn assembly:assembly
#export MVN_HOME=/usr/local/apache-maven
#export PATH=${MVN_HOME}/bin:${PATH}
#export MANPATH=${MVN_HOME}/man:$MANPATH
#-----------
# jmeter
# export JMETER_HOME=/usr/local/jmeter
# export PATH=${JMETER_HOME}/bin:${PATH}
# export MANPATH=${JMETER_HOME}/man:$MANPATH
#-----------
# custom openssl
# export OPENSSL_HOME=/usr/local/ssl
# export PATH=${OPENSSL_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${OPENSSL_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${OPENSSL_HOME}/man:$MANPATH
#-----------
# postgres
# export POSTGRES_HOME=/usr/local/pgsql
# export PATH=${POSTGRES_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${POSTGRES_HOME}/lib:$LD_LIBRARY_PATH
# export PGDATA=${POSTGRES_HOME}/data
# export MANPATH=${POSTGRES_HOME}/man:$MANPATH
#-----------
# mysql
# export MYSQL_UNIX_PORT=/usr/local/mysql/mysql.sock
# export MYSQL_HOME=/usr/local/mysql
# export PATH=${MYSQL_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${MYSQL_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${MYSQL_HOME}/man:$MANPATH
#-----------
# apache
# export APACHE_HOME=/usr/local/apache2
# export PATH=${APACHE_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${APACHE_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${APACHE_HOME}/man:$MANPATH
#-----------
# cvs
# export CVSROOT=:ext:uesr@hostname:/path/to/cvs
# export CVS_RSH=ssh
# export CVSROOT=:pserver:user@hostname
#-----------
# gtags ( $ cd ?? ; gtags ~/.gtags )
# export GTAGSROOT=/usr/include
# export GTAGSDBPATH=~/.gtags

#-----------
# ruby
if [[ -s /usr/local/rvm/scripts/rvm ]] ; then
    source /usr/local/rvm/scripts/rvm ;
fi
# if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then source "$HOME/.rvm/scripts/rvm"; fi
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Oracle
# export ORACLE_HOME=/usr/local/instantclient_11_1
# export TNS_ADMIN=${ORACLE_HOME}
# export PATH=$ORACLE_HOME:$PATH
# export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH

#-----------
# node.js
export NODEJS_HOME=/usr/local/nodejs
export PATH=${NODEJS_HOME}/bin:${PATH}
export MANPATH=${NODEJS_HOME}/man:$MANPATH
export LD_LIBRARY_PATH=${NODEJS_HOME}/lib:$LD_LIBRARY_PATH
export NODE_PATH=/usr/local/nodejs/lib/node_modules/

#----------------
# path
export MANPATH=~/sfw/man:/usr/local/man:$MANPATH
export PATH=~/sfw/sbin:~/sfw/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LD_LIBRARY_PATH=~/sfw/lib:$LD_LIBRARY_PATH:/usr/local/lib
export PATH=/Applications/Emacs.app/Contents/MacOS:${PATH}

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

source ~/.env
