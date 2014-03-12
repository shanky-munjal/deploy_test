require "rvm/capistrano"
require "bundler/capistrano"
server "106.187.44.137", :web, :app, :db, primary:true
set :application, "deploy_test"
set :repository,  "git@github.com:shanky-munjal/deploy_test.git"
set :user, "quovantis"
set :deploy_to, "/home/quovantis/deploy_test"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, :git
set :branch, "master"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# namespace :deploy do
# 	desc "Creating symlink"
# 	task :custom_symlink, :roles => :app do
# 		run "ln -s #{ shared_path }/database.yml #{ current_path }/config/database.yml"
# 	end

# end
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# after "deploy:update_code", "deploy:migrate"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end