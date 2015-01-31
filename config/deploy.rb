lock '3.3.5'

set :application, 'BassetScan'
set :repo_url, 'git@bitbucket.org:masa331/basset_scan.git'

set :deploy_to, '/var/www/basset_scan'

# set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :bundle_binstubs, nil
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :rails_env, 'production'
# set :stage, :production

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
