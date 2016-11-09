workers Integer(ENV['PUMA_WORKERS'] || 1)

threads Integer(ENV['MIN_THREADS'] || 2),
        Integer(ENV['MAX_THREADS'] || 2)

preload_app!

rackup DefaultRackup

# Heroku will set this when the web process boots up
port ENV['PORT'] || 3000

# On Heroku this will be set to 'production' by default
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
