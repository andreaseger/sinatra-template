#Sinatra Template

A nice little [sinatra](http://www.sinatrarb.com/) template which uses to following stuff

- [bundler](http://gembundler.com/)
- [thin](http://code.macournoyer.com/thin/) for development & a example [unicorn](http://unicorn.bogomips.org/) config
- [rspec](https://www.relishapp.com/rspec), [capybara](https://github.com/jnicklas/capybara), [mocha](http://mocha.rubyforge.org/)
- [guard](http://rubydoc.info/github/guard/guard/master/frames) setup with rspec, compass, livereload
- [capistrano](http://capify.org) incl. a example deploy config
- [rack-flash](https://github.com/nakajima/rack-flash)
- [haml](http://haml-lang.com/)
- [compass](http://compass-style.org/) + [susy](http://susy.oddbird.net/) + default layout & stylesheet (inpired by [HTML5 Boilerplate](http://html5boilerplate.com))

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


##meta

**sch1zo**
