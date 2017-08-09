class PostSerializer < ApplicationSerializer
  attributes :title, :text

  def text
    object.description
  end
end
