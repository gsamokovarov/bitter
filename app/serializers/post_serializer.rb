class PostSerializer < ActiveModel::Serializer
  attributes :title, :text

  def text
    object.description
  end
end
