class UserWithTokenSerializer < UserSerializer
  attributes :jwt

  def jwt
    Token.encode(sub: object.id)
  end
end
