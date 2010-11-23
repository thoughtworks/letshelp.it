# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

LetshelpIt::Application.load_tasks

task 'selenium' => ['test:start_selenium_server', 'test:acceptance', 'test:stop_selenium_server']

namespace :test do
  task :all => [:units, :functionals, :acceptance]

  task(:acceptance) { sh 'bundle exec spec test/acceptance --colour --format nested' }

  task(:start_selenium_server) { sh 'rails server -d'; sleep 10 }

  task(:stop_selenium_server) { sh "kill -9 #{File.read('tmp/pids/server.pid')}" }
end

