require 'bundler/capistrano'

set :application, "sinatra-template"
set :domain, "www.example.de"
set :user, "deployer"

set :deploy_to, "/www-data/#{application}"
set :repository,  "git://github.com/"
set :scm, :git

server domain, :app, :web, :db, :primary => true
ssh_options[:port]=12345
default_environment['PATH']='/usr/local/bin:/usr/bin:/bin:/opt/ruby/bin'

pid = 'tmp/pids/unicorn.pid'

namespace :deploy do
  desc "start the app"
  task :start, :roles => :app, :except => { :no_release => true } do
    sudo "PATH=$PATH RAILS_ENV=production sh -c 'cd #{current_path} && bundle exec unicorn_rails -c config/unicorn.rb -D'"
  end
  desc "stop the app"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} kill -QUIT `cat #{pid}`"
  end
  desc "restart/reload the app"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} kill -USR2 `cat #{pid}`"
  end
end

namespace :symlink do
  desc "reset symlink to current"
  task :httpdocs do
    run "#{try_sudo} ln -nfs #{current_release} /var/www/#{application}"
  end
  desc "link sensitive data"
  task :sensitive_data do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/settings.yml #{release_path}/config/settings.yml"
    run "ln -nfs #{shared_path}/newrelic.yml #{release_path}/config/newrelic.yml"
    run "ln -nfs #{shared_path}/unicorn.rb #{release_path}/config/unicorn.rb"
  end
end

# HOOKS
after ["deploy:symlink", "deploy:rollback"] do
  symlink.httpdocs
  sudo "chgrp www-data #{current_release}/tmp -R"
  sudo "chgrp www-data #{current_release}/public -R"
  sudo "chmod g+w #{current_release}/tmp -R"
end
after "deploy:update_code" do
  symlink.sensitive_data
end

