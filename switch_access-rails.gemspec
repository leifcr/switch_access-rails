# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'switch_access/rails/version'

Gem::Specification.new do |s|
  s.name        = 'switch_access-rails'
  s.version     = SwitchAccess::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Rails 3.2 integration Jquery Switch access.'
  s.description = "Integrates jquery switch access plugin #{SwitchAccess::Rails::SWITCHACCESSLIB_VERSION} into rails apps."
  s.homepage    = 'https://github.com/leifcr/switch_access-rails'
  s.files       = Dir['README.md', 'LICENSE', 'Rakefile', 'lib/**/*', 'vendor/**/*', 'switch_access-rails.gemspec']
  s.authors     = ['Leif Ringstad']
  s.email       = 'leifcr@gmail.com'

  s.add_dependency 'actionpack',    '~> 3.2.0'
  s.add_dependency 'jquery-rails',  '>= 2.2.0'
  s.add_dependency 'coffee-rails',  '>= 3.2.2'

  s.add_development_dependency 'rake', '~> 10.0.2'
  s.require_paths = ["lib"]
end
