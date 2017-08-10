module RequestLoginHelper
  def login(user)
    jwt_token = Token.encode(sub: user.id)
    { 'Authorization' => "Bearer: #{jwt_token}" }
  end
end
