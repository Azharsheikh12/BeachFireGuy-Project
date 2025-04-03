# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

# set :application, "my_app_name"
# set :repo_url, "git@example.com:me/my_repo.git"
require 'capistrano/passenger'

# set :nvm_type, :user # or :system, depends on your nvm setupset :nvm_node, 'v0.10.21'set :nvm_map_bins, %w{node npm}
set :application, "beachfireguy"
set :repo_url, "git@github.com:deepak45gupta/beachfireguy.git"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rvm_ruby_version, '3.0.0'
# set :nvm_node, 'v14.21.3'
set :passenger_restart_with_touch, true
# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
# set :default_env, { SKIP_CSS_BUILD: 'true' }

# namespace :deploy do
#   desc 'Precompile assets'
#   task :precompile_assets do
#     on roles(:app) do
#       within release_path do
#         # Set the Node.js version
#         execute :nvm, "use 14.21.3"

#         # Run asset precompilation
#         execute :bundle, "exec rake assets:precompile"
#       end
#     end
#   end
#  # Define deployment flow
#   after :updated, :precompile_assets
#   after :finishing, :cleanup
# end 

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
