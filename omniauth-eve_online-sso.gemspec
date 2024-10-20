# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/eve_online/sso/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-eve_online-sso"
  spec.version = Omniauth::EveOnline::SSO::VERSION
  spec.authors = ["Ihor Zubkov"]
  spec.email = ["igor.zubkov@gmail.com"]

  spec.summary = "OmniAuth strategy for EveOnline SSO"
  spec.description = "OmniAuth strategy for EveOnline SSO"
  spec.homepage = "https://github.com/evemonk/omniauth-eve_online-sso"
  spec.license = "MIT"

  spec.metadata = {
    "rubygems_mfa_required" => "true",
    "bug_tracker_uri" => "https://github.com/evemonk/omniauth-eve_online-sso/issues",
    "changelog_uri" => "https://github.com/evemonk/omniauth-eve_online-sso/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://github.com/evemonk/omniauth-eve_online-sso/blob/main/README.md",
    "homepage_uri" => "https://github.com/evemonk/omniauth-eve_online-sso",
    "source_code_uri" => "https://github.com/evemonk/omniauth-eve_online-sso"
  }

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency "omniauth-oauth2"
  spec.add_dependency "jwt"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
