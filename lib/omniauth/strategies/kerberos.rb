# omniauth-kerberos2/lib/omniauth/strategies/kerberos.rb
require 'omniauth'
require 'krb5_auth'
require 'omniauth/multipassword/base'

module OmniAuth
  module Strategies
    class Kerberos
      include OmniAuth::Strategy
      # include OmniAuth::MultiPassword::Base

      option :name, 'kerberos'
      option :fields, %i[username password]

      def initialize(app, *args, &block)
        super
        @krb5 = ::Krb5Auth::Krb5.new
      end

      def self.included(base)
        base.class_eval do
          option :title,  'Restricted Access'
          option :fields, %i[username password]

          uid { username }
        end
      end

      def username_id
        options[:fields][0] || 'username'
      end

      def password_id
        options[:fields][1] || 'password'
      end

      def username
        @username || request&.params['username']&.to_s
      end

      def init_authenticator(request, env, username)
        @request  = request
        @env      = env
        @username = username
      end

      def callback_phase
        if authenticate(username, request&.params['password'])
          super
        else
          fail!(:invalid_credentials)
        end
      end

      def request_phase
        form = OmniAuth::Form.build(title: options.title, url: callback_url) do |f|
          f.text_field     'Username', username_id
          f.password_field 'Password', password_id
        end
        form.to_response
      end

      def other_phase
        if on_request_path?
          request_phase
        else
          call_app!
        end
      end

      info do
        { username: username,
          email: username + '@' + @krb5.get_default_realm.downcase }
      end

      private

      def authenticate(username, password)
        p username
        p password
        @krb5.get_init_creds_password(username, password)
        true
      rescue ::Krb5Auth::Krb5::Exception
        false
      end
    end
  end
end

OmniAuth.config.add_camelization 'kerberos', 'Kerberos'
