# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'switch_access/rails/version'

Gem::Specification.new do |s|
  s.name        = 'switch-access-rails'
  s.version     = SwitchAccess::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Rails 3.2 integration Jquery Switch access.'
  s.description = 'Integrates jquery switch access plugin into rails apps.'
  s.homepage    = 'https://github.com/leifcr/switch-access-rails'
  s.files       = Dir['README.md', 'LICENSE', 'Rakefile', 'lib/**/*', 'vendor/**/*']
  s.authors     = ['Leif Ringstad']
  s.email       = 'leifcr@gmail.com'

  s.add_dependency 'actionpack',    '~> 3.2.8'
  s.add_dependency 'jquery-rails',  '~> 2.1.1'
  s.add_dependency 'coffee-rails',  '~> 3.2.2'

  s.add_development_dependency 'rake', '0.9.2'
  s.require_paths = ["lib"]
end
