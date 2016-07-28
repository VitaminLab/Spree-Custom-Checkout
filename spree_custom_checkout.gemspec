# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_custom_checkout'
  s.version     = '1.0.2'
  s.summary     = 'One page checkout with Spree'
  s.description = 'Implement a custom checkout with Spree. The goal here is to merge guest signup, address and delivery on the same page.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Yad F'
  s.email     = 'yad.faeq@gmail.com'
  s.homepage     = 'https://github.com/0bserver07/Spree-Custom-Checkout'


  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.1.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails', '~> 5.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
