# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ['Julien Chabanon']
  gem.email         = ['julien@chabanon.me']
  gem.description   = 'An OmniAuth strategy for Kerberos that works with OmniAuth 2.0'
  gem.summary       = 'An OmniAuth strategy for Kerberos.'
  gem.homepage      = 'https://github.com/julienchabanon/omniauth-kerberos-clearlyip'
  gem.license      =  'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = Dir["lib/**/*.rb"]
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-kerberos-clearlyip'
  gem.require_paths = ['lib']
  gem.version       = '0.1.0'
  gem.required_ruby_version = '>= 2.5.0'

  gem.add_dependency 'omniauth', '~> 2.0'
  gem.add_dependency 'timfel-krb5-auth', '~> 0.8'
end
