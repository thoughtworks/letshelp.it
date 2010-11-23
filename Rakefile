# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

LetshelpIt::Application.load_tasks

task :'test:all' => [:'test:units', :'test:functionals', :'test:acceptance']

task 'selenium' => [:start_selenium_server, :'test:acceptance', :stop_selenium_server]

task :'test:acceptance' do
  sh 'bundle exec spec test/acceptance --colour --format nested'
end

task :start_selenium_server do
  sh 'rails server -d'
  sleep 10
end

task :stop_selenium_server do
  sh "kill -9 #{File.read('tmp/pids/server.pid')}"
end

