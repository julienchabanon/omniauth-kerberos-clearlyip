# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ['Julien Chabanon']
  gem.email         = ['julien@chabanon.me']
  gem.description   = 'An OmniAuth strategy for Kerberos.'
  gem.summary       = 'An OmniAuth strategy for Kerberos.'
  gem.homepage      = 'https://github.com/julienchabanon/omniauth-kerberos2'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-kerberos2'
  gem.require_paths = ['lib']
  gem.version       = '0.0.1'

  gem.add_dependency 'timfel-krb5-auth', '~> 0.8'
  gem.add_dependency 'omniauth-multipassword'
end
