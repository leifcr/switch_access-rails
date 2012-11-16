require 'rubygems'
require 'rake'
require 'rubygems/package_task'

$:.push File.expand_path('../lib', __FILE__)
require 'switch_access/rails/version'

gemspec = eval(File.read('switch-access-rails.gemspec'))
Gem::PackageTask.new(gemspec) do |pkg|
  pkg.gem_spec = gemspec
end

desc 'build the gem and release it to rubygems.org'
task :release => :gem do
  sh "gem push pkg/switch-access-rails-#{SwitchAccess::Rails::VERSION}.gem"
end
