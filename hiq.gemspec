# frozen_string_literal: true

lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "hiq/version"

Gem::Specification.new do |s|
  s.name = 'hiq'
  s.version     = Hiq::VERSION
  s.summary     = 'Hiq - a Haiku generator'
  s.description = 'A simple Haiku generator gem'
  s.authors     = ['Jan Taras']
  s.email       = 'jan.taras29@gmail.com'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'https://github.com/TarasJan/hiq'
  s.license = 'MIT'
  s.require_paths = %w(lib)
  s.required_ruby_version = '>= 2.6.0'

  s.add_development_dependency 'byebug', '~> 11.1.0'
  s.add_development_dependency 'irb', '~> 1.4.1'
  s.add_development_dependency 'pry', '~> 0.14.1'
  s.add_development_dependency 'rspec', '~> 3.11.0'
  s.add_development_dependency 'rubocop', '~> 1.26.0'
end
