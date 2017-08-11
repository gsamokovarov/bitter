# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "bitter"
set :repo_url, "https://github.com/gsamokovarov/bitter"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/bitter"

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
