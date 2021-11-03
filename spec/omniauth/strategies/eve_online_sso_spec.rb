# frozen_string_literal: true

require "spec_helper"

RSpec.describe OmniAuth::Strategies::EveOnlineSso do
  subject { described_class.new(app) }

  let(:access_token) { instance_double("AccessToken", options: {}) }

  before do
    OmniAuth.config.test_mode = true

    allow(subject).to receive(:access_token).and_return(access_token)
  end

  after do
    OmniAuth.config.test_mode = false
  end

  it "has a name" do
    expect(subject.name).to eq("eve_online_sso")
  end

  describe "client options" do
    subject { described_class.new(app).client }

    it "has the correct site" do
      expect(subject.site).to eq "https://login.eveonline.com/"
    end

    it "has the correct authorize path" do
      expect(subject.options[:authorize_url]).to eq "/v2/oauth/authorize"
    end

    it "has the correct token path" do
      expect(subject.options[:token_url]).to eq "/v2/oauth/token"
    end
  end

  describe "#raw_info" do
    let(:scope) { %w[esi-calendar.read_calendar_events.v1 publicData] }
    let(:encoded_oauth_token) do
      payload = {
        "scp" => scope,
        "jti" => "998e12c7-3241-43c5-8355-2c48822e0a1b",
        "kid" => "JWT-Signature-Key",
        "sub" => "CHARACTER:EVE:123123",
        "azp" => "my-3rdparty-client-id",
        "name" => "Real Character",
        "owner" => "8PmzCeTKb4VFUDrHLc/AeZXDSWM=",
        "exp" => Time.new(2000, 1, 2).to_i,
        "iat" => Time.new(2000).to_i,
        "iss" => "login.eveonline.com"
      }
      JWT.encode(payload, nil, "none")
    end

    before do
      allow(access_token).to receive(:token).and_return(encoded_oauth_token)
    end

    it "parses character ID" do
      expect(subject.raw_info.fetch("character_id")).to eq("123123")
    end

    it "parses scopes" do
      expect(subject.raw_info.fetch("scopes")).to eq(scope.join(" "))
    end

    it "parses expiration date" do
      expect(subject.raw_info.fetch("expires_on")).to eq(Time.new(2000, 1, 2).to_i)
    end

    it "parses the token type" do
      expect(subject.raw_info.fetch("token_type")).to eq("Character")
    end

    context "with single scope component" do
      let(:scope) { "publicData" }

      it "parses scopes" do
        expect(subject.raw_info.fetch("scopes")).to eq("publicData")
      end
    end
  end

  def app
    lambda do |_env|
      [200, {}, ["Welcome to EVE Online."]]
    end
  end
end
