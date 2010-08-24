#Thanks to http://ephekt.com/?p=40

OUTPUT_DIR = 'coverage'

def run_coverage(files)
  rm_rf OUTPUT_DIR
 
  # turn the files we want to run into a  string
  if files.length == 0
    puts "No files were specified for testing"
    return
  end
 
  files = files.join(" ")
 
  #crazy hack... not sure what's that about
  #if PLATFORM =~ /darwin/
    exclude = '--exclude "gems/*"'
  #else
  #  exclude = '--exclude "rubygems/*"'
  #end
 
  rcov = "rcov --rails -Ilib:test --sort coverage --text-report #{exclude} --output #{OUTPUT_DIR}"
  cmd = "#{rcov} #{files}"
  sh cmd
end
 
namespace :test do
 
  desc "Measures unit, functional, and integration test coverage"
  task :coverage do
    run_coverage Dir["test/**/*.rb"]
  end
 
  namespace :coverage do
    desc "Runs coverage on unit tests"
    task :units do
      run_coverage Dir["test/unit/**/*.rb"]
    end
    desc "Runs coverage on functional tests"
    task :functionals do
      run_coverage Dir["test/functional/**/*.rb"]
    end
    desc "Runs coverage on integration tests"
    task :integration do
      run_coverage Dir["test/integration/**/*.rb"]
    end
  end
end