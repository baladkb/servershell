#!/bin/bash
set_environment(){
 	source env.sh
}

update_server(){
	sudo apt-get update
	/bin/bash --login
}

set_environment
update_server
for MODULE in $SCRIPT_MODULES
do
  echo "Running the module $MODULE"
  "./modules/${MODULE}/main.sh"
  if [ "$?" -ne "0" ]
  	then
  	echo "Could not run the module $MODULE"
  fi
done
