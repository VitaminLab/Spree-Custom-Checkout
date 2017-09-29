# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_custom_checkout'
  s.version     = '1.0.0'
  s.summary     = 'One page checkout with Spree'
  s.description = 'Implement a custom checkout with Spree. The goal here is to merge guest signup, address and delivery on the same page.'
  s.required_ruby_version = '>= 2.3.0'

  s.author    = 'Yaniv Ran'
  s.email     = 'yaniv.ran@gmail.com'
  s.homepage     = 'https://github.com/YanivRan/Spree-Custom-Checkout'
  s.licenses = ["MIT"]
  s.requirements = ["none"]


  s.require_path = 'lib'

  s.add_dependency 'spree_core', '~> 3.3.0'

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
