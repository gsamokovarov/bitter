class JWTMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    token = extract_token_from(env)
    return @app.call(env) if token.blank?

    env['jwt.token'] = Token.decode(token)

    @app.call(env)
  rescue JWT::DecodeError
    [401, {}, [{code: :unauthorized}.to_json]]
  end

  private

  def extract_token_from(env)
    env['HTTP_AUTHORIZATION'].to_s.match(/Bearer:\s?(.*)/) { |m| m[1] }
  end

  def invalid?(token)
    return false if token.blank?

    # Test if the token is decodable.
    Token.decode(token)
    false
  rescue JWT::DecodeError
    true
  end
end
