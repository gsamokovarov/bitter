require 'rails_helper'

RSpec.describe Comment do
  it 'tests that rails and factory_girl works' do
    expect(create :comment).to be_valid
  end
end
