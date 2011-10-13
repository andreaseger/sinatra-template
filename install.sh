#!/bin/bash

txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtblu=$(tput setaf 4)    # Blue
txtrst=$(tput sgr0)       # Text reset

if [ -n "$1" ]; then
  name=$1
else
  echo -n "${txtylw}Enter the name of the App to create (default: sinatra-template) > ${txtrst}"
  read text
  if [ -n "$text" ]; then
    name=$text
  else
    name="sinatra-template"
  fi
fi

echo "${txtylw}attempt to create the app in ${txtblu}$name${txtrst}"

if [ ! -d "$name" ]; then
  git clone git://github.com/sch1zo/sinatra-template.git $name
  cd $name

  rm -rf .git
  rm "install.sh"

  #install bundler if its not already
  if ! command -v bundle ; then
    gem install bundler
  fi
  # Bundle while reducing excess noise.
  bundle | grep -v 'Using' | grep -v 'complete' | sed '/^$/d'

  git init
  git add .
  git commit -m "app $name initialized from template"

  echo "${txtgrn}app successfully created. Happy coding!${txtrst}"
else
  echo "${txtred}a directory named $name already exists - choose another one name${txtrst}"
fi
