#! /bin/bash

echo "RVM Module"

check_status(){
  if [ "$1" -ne 0 ]
  then
  echo "Exiting with code $2"
  fi
}

install_rvm(){
  echo "Downloading RVM"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  echo "Setting RVM path"
 source ~/.rvm/scripts/rvm
}


if [ -e ~/.rvm/scripts/rvm ]
then
  echo "RVM already exists"
  source ~/.rvm/scripts/rvm
else
  install_rvm
  check_status $? 2
fi



echo "Module Ruby"
install_ruby(){

RUBY=$(which ruby | wc -l)
if [ "$RUBY" -ne "0" ]
  then
  INSTALLED_RUBY_VERSION=$(ruby --version)
  echo "Ruby already installed $INSTALLED_RUBY_VERSION"
else
   ~/.rvm/bin/rvm install $SCRIPT_RUBY_VERSION
   echo "installing bundler"
   gem install bundler
fi
rvm use $SCRIPT_RUBY_VERSION --default
}

install_ruby

