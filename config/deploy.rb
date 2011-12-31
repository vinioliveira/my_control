# =============================================================================
# CUSTOM OPTIONS
# =============================================================================
set :user, "deploy"
set :application, "mycontrol"
server "vinioliveira.com", :app, :web, :db, :primary => true

# =============================================================================
# DATABASE OPTIONS
# =============================================================================
set :rails_env, "production"

# =============================================================================
# DEPLOY TO
# =============================================================================
set :deploy_to, "/var/www/#{application}"

# =============================================================================
# REPOSITORY
# =============================================================================
set :scm, "git"
set :repository, "git://github.com/vinioliveira/my_control.git"
set :branch, 'master'

# =============================================================================
# SSH OPTIONS
# =============================================================================

ssh_options[:forward_agent] = true
set :use_sudo, false

# =============================================================================
# DEFAULT RECIPE
# =============================================================================

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#RVM hack
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano" # Load RVM's capistrano plugin.
set :rvm_bin_path, "$HOME/.rvm/bin"
set :rvm_ruby_string, '1.9.2-p290@control'
set :rvm_type, :user

require "bundler/capistrano"

after 'deploy:update_code' do
  run "cd #{release_path}; cp config/database.yml.sample config/database.yml"
end