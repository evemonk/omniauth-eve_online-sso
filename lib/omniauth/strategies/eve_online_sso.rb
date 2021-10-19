# frozen_string_literal: true

require "omniauth-oauth2"
require "jwt"

module OmniAuth
  module Strategies
    class EveOnlineSso < OmniAuth::Strategies::OAuth2
      option :name, "eve_online_sso"

      option :client_options,
        authorize_url: "/v2/oauth/authorize",
        token_url: "/v2/oauth/token",
        site: "https://login.eveonline.com/"

      uid { raw_info["character_id"] }

      info do
        {
          name: raw_info["name"],
          character_id: raw_info["character_id"],
          expires_on: raw_info["expires_on"],
          scopes: raw_info["scopes"],
          token_type: raw_info["token_type"],
          character_owner_hash: raw_info["owner"]
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= JWT.decode(access_token.token, nil, false)
          .find { |element| element.keys.include?("scp") }.tap do |hash|
          hash["character_id"] = hash["sub"].split(":")[-1]
          hash["scopes"] = hash["scp"].join(" ")
          hash["token_type"] = hash["sub"].split(":")[0].capitalize
          hash["expires_on"] = hash["exp"]
        end
      end
    end
  end
end
