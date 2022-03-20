# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'hiq'
  s.version     = '0.2.0'
  s.summary     = 'Hiq - a Haiku generator'
  s.description = 'A simple Haiku generator gem'
  s.authors     = ['Jan Taras']
  s.email       = 'jan.taras29@gmail.com'
  s.files       = ['lib/hiq.rb']
  s.homepage    =
    'https://rubygems.org/gems/hiq'
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.6.0'

  s.add_development_dependency 'byebug', '~> 11.1.0'
  s.add_development_dependency 'irb', '~> 1.4.1'
  s.add_development_dependency 'pry', '~> 0.14.1'
  s.add_development_dependency 'rspec', '~> 3.11.0'
  s.add_development_dependency 'rubocop', '~> 1.26.0'
end
