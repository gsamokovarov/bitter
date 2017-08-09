require 'spec_helper'

RSpec.describe Token do
  let :subject_42_token do
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQyfQ.4XsMaK6qBwGAT95eV-UpYsjjmhhmdS-BtW57YgxyhLo"
  end

  describe "#decode" do
    it "decodes a JWT token string into claims" do
      claims = Token.decode(subject_42_token)

      expect(claims).to eq "sub" => 42
    end
  end

  describe "#encode" do
    it "encodes claims into JWT token string" do
      token = Token.encode sub: 42

      expect(token).to eq subject_42_token
    end
  end
end
