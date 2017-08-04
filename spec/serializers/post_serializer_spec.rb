require 'rails_helper'

RSpec.describe PostSerializer do
  it 'exposes title and text' do
    post = Post.new title: :foo, description: :something

    expect(post).to be_serialized_as(
      title: 'foo',
      text: :something
    )
  end
end

