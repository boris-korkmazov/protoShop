# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'protoShop'
set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }
set :repo_url, 'git@github.com:boris-korkmazov/protoShop.git'
set :rvm_ruby_version, '2.3.0@siberium'
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/opt/protoShop'


# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  desc "run db:seed"
  task :seed do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute :rake, "db:seed", "RAILS_ENV=production"
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
after 'deploy:publishing', 'deploy:restart'
