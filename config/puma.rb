# Default configuration file supplied by https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 2)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end

@worker = nil

if ENV['RAILS_ENV'] == 'staging'
  before_fork do |server, worker|
    @worker ||= spawn("bundle exec rake jobs:work")
  end
end
