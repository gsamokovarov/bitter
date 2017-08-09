require 'rails_helper'

RSpec.describe TokenSerializer do
  class FakeTokenProxy
    delegate_missing_to :@target

    def initialize(target)
      @target = target
    end

    # We made this proxy, cause I don't know how to create the RSpec
    # be_serialized_as with the interface I want. The interface I want is:
    # be_serialized_as(TokenSerializer, { attributes: :hash }). HALP!
    def class
      Token
    end
  end

  it 'exposes jwt' do
    user = FakeTokenProxy.new(build :user, id: 42)

    expect(user).to be_serialized_as(
      jwt: Token.encode(sub: 42)
    )
  end
end
