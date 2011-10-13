git clone git://github.com/sch1zo/sinatra-template.git $1
if $1
then
  cd $1
else
  cd sinatra-template
fi

rm -rf .git

#install bundler if its not already
if ! command -v bundle ; then
  gem install bundler
fi
# Bundle while reducing excess noise.
bundle | grep -v 'Using' | grep -v 'complete' | sed '/^$/d'

git init
git add .
git commit -m "app initialized from template"
