# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

LetshelpIt::Application.load_tasks

Rake::TestTask.new do |t|
  t.name = 'test:acceptance'
  t.libs << "test"
  t.test_files = FileList['test/acceptance/*_test.rb']
  t.verbose = true
end

