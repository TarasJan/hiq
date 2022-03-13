Gem::Specification.new do |s|
    s.name        = 'hiq'
    s.version     = '0.0.1'
    s.summary     = "Hiq - a Haiku generator"
    s.description = "A simple Haiku generator gem"
    s.authors     = ["Jan Taras"]
    s.email       = 'jan.taras29@gmail.com'
    s.files       = ["lib/hiq.rb"]
    s.homepage    =
      'https://rubygems.org/gems/hiq'
    s.license       = 'MIT'

    s.add_development_dependency "rspec"
    s.add_development_dependency "byebug"
    s.add_development_dependency "pry"
  end