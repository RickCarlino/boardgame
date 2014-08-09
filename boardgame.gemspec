$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.authors = ['Rick Carlino']
  s.description = "A simple Ruby object library for board and tile based games."
  s.email = 'rick.carlino@gmail.com'
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/rickcarlino/shiny-octo-nemesis'
  s.license = 'MIT'
  s.name = 'boardgame'
  s.require_paths = ['lib']
  s.summary = "Control logic for board and tile based games using Ruby."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = '0.0.1'
end