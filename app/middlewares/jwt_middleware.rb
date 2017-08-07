class JWTMiddleware
  cattr_accessor :secret

  cattr_accessor :algorithm
  self.algorithm = 'HS256'

  def initialize(app)
    @app = app
  end

  def call(env)
    token = extract_token_from(env)
    return @app.call(env) if token.blank?

    claims = decode_token(token)
    env['jwt.token'] = claims

    @app.call(env)
  rescue JWT::DecodeError
    [401, {}, [{code: :unauthorized}.to_json]]
  end

  private

  def extract_token_from(env)
    env['HTTP_AUTHORIZATION'].to_s.match(/Bearer:\s?(.*)/) { |m| m[1] }
  end

  def decode_token(token)
    JWT.decode(token, secret, true, { algorithm: algorithm }).first
  end

  def invalid?(token)
    return false if token.blank?

    JWT.decode token, secret, true, { algorithm: algorithm }
    false
  rescue JWT::DecodeError
    true
  end
end
