# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

LetshelpIt::Application.load_tasks

task 'selenium' => ['test:acceptance']

namespace :test do
  task :all => [:units, :functionals, :acceptance]
  task('acceptance') { sh 'rspec spec'}
end

