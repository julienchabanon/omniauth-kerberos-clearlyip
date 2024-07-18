require 'omniauth'
require 'krb5_auth'
require 'omniauth/multipassword/base'

module OmniAuth
  module Strategies
    class Kerberos
      include OmniAuth::Strategy
      include OmniAuth::MultiPassword::Base

      option :name, 'kerberos'

      def initialize(app, *args, &block)
        super
        @krb5 = ::Krb5Auth::Krb5.new
      end

      def request_phase
        OmniAuth::Form.build(title: 'Kerberos Authentication') do
          text_field 'Username', 'username'
          password_field 'Password', 'password'
        end.to_response
      end

      def callback_phase
        username = request['username']
        password = request['password']

        if authenticate(username, password)
          super
        else
          fail!(:invalid_credentials)
        end
      rescue => e
        fail!(:invalid_credentials, e)
      end

      uid { request['username'] }

      info do
        {
          username: request['username'],
          email: request['username'] + '@' + @krb5.get_default_realm.downcase
        }
      end

      private

      def authenticate(username, password)
        @krb5.get_init_creds_password(username, password)
        true
      rescue ::Krb5Auth::Krb5::Exception
        false
      end
    end
  end
end

OmniAuth.config.add_camelization 'kerberos', 'Kerberos'
