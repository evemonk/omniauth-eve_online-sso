require "spec_helper"

RSpec.describe OmniAuth::Strategies::EveOnlineSso do
  it "has a version number" do
    expect(Omniauth::EveOnline::SSO::VERSION).not_to be nil
  end
end
