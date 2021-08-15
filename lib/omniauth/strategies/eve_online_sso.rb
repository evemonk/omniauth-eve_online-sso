# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class EveOnlineSso < OmniAuth::Strategies::OAuth2
      option :name, "eve_online_sso"

      option :client_options, authorize_path: "/v2/oauth/authorize",
                              site: "https://login.eveonline.com/",
                              proxy: ENV["http_proxy"] ? URI(ENV["http_proxy"]) : nil

      uid { raw_info["CharacterID"] }

      info do
        {
          name: raw_info["CharacterName"],
          character_id: raw_info["CharacterID"],
          expires_on: raw_info["ExpiresOn"],
          scopes: raw_info["Scopes"],
          token_type: raw_info["TokenType"],
          character_owner_hash: raw_info["CharacterOwnerHash"]
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/v2/oauth/verify").parsed
      end
    end
  end
end
