# Omniauth::Strategies::Kerberos

**omniauth-kerberos** is a simple [OmniAuth](https://github.com/intridea/omniauth) strategy to authenticate using a Kerberos server. This gem require omniauth 2.0 or above.

This is a fork of [omniauth-kerberos](https://github.com/jgraichen/omniauth-kerberos) that is not using [omniauth-multipassword](https://github.com/jgraichen/omniauth-multipassword) as a dependency.
Also, the default form title has been changed to expose the krb realm.


## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-kerberos-clearlyip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-kerberos-clearlyip

Kerberos development headers are required to build dependencies.

On Debian try:

	$ sudo apt-get install libkrb5-dev

 On Arch try:
 
	$ sudo pacman -S krb5

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
The title text shown on the login form.
(default: `Kerberos Authentication @example.com`)

** fields **
The request parameter names to fetch username and password.
(default: `[ "username", "password" ]`)


## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2024, Julien Chabanon
