require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Eveonline < OmniAuth::Strategies::OAuth2
      option :name, 'eveonline'

      option :client_options, { authorize_path: '/oauth/authorize',
                                site: 'https://login.eveonline.com/',
                                proxy: ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil }

      uid { raw_info['CharacterID'] }

      def raw_info
        @raw_info ||= access_token.get('/oauth/verify').parsed
      end
    end
  end
end
