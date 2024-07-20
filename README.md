# Omniauth::Strategies::Kerberos

[![Build Status](https://travis-ci.org/jgraichen/omniauth-kerberos.svg)](https://travis-ci.org/jgraichen/omniauth-kerberos)
[![Code Climate](https://codeclimate.com/github/jgraichen/omniauth-kerberos/badges/gpa.svg)](https://codeclimate.com/github/jgraichen/omniauth-kerberos)
[![Test Coverage](https://codeclimate.com/github/jgraichen/omniauth-kerberos/badges/coverage.svg)](https://codeclimate.com/github/jgraichen/omniauth-kerberos/coverage)

**omniauth-kerberos** is a simple [OmniAuth](https://github.com/intridea/omniauth) strategy to authenticate using a Kerberos server. This gem require omniauth 2.0 or above.

This is a fork of [omniauth-kerberos](https://github.com/jgraichen/omniauth-kerberos) that is compatible with omniauth 2.0. If your app require omniauth 1.X for some reasons, please use [omniauth-kerberos](https://github.com/jgraichen/omniauth-kerberos).
I also removed the dependency and the use of [omniauth-multipassword](https://github.com/jgraichen/omniauth-multipassword).


## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-kerberos'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-kerberos

Kerberos development headers are required to build dependencies.

On Debian try:

	$ sudo apt-get install libkrb5-dev


## Usage

Use **omniauth-kerberos** like any other OmniAuth strategy:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :kerberos
end
```

You still need to configure your system for Kerberos usage like specifying realms. If you has your own login form you can specify the fields to use:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :kerberos, :fields => [ :login, :pwd ]
end
```


## Options

** title **
The title text shown on default login form.
(default: `"Restricted Access"`)

** fields **
The request parameter names to fetch username and password.
(default: `[ "username", "password" ]`)


## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2024, Julien Chabanon
