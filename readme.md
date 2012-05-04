#Sinatra Template

A nice little [sinatra](http://www.sinatrarb.com/) template which uses to following stuff

- bundler
- puma
- Mustache/ICanHaz
- Mongoid
- sprockets

##directly create a app with this line

    ## to create the app within the folder sinatra-template do
    wget https://raw.github.com/sch1zo/sinatra-template/master/install.sh -O - | sh
    ## or
    curl https://raw.github.com/sch1zo/sinatra-template/master/install.sh | sh

    ## to give the folder a different name do this
    wget https://raw.github.com/sch1zo/sinatra-template/master/install.sh && sh install.sh APP_NAME && rm install.sh
    ## or use the little wizard
    wget https://raw.github.com/sch1zo/sinatra-template/master/install.sh && sh install.sh && rm install.sh

###Notes
- the install script will simply pick up the current ruby to install and run bundler 
- autoinstall will probably only work with [rbenv](https://github.com/sstephenson/rbenv), [rvm](http://beginrescueend.com/) or similar, cause they normally don't need sudo for that
- didn't test the rake task for assets yet, they probably dont work and/or set you machine on fire

##meta

**sch1zo**