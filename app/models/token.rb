module Token
  cattr_accessor :secret
  cattr_accessor(:algorithm) { 'HS256' }

  module_function

  def decode(token)
    JWT.decode(token, secret, true, { algorithm: algorithm }).first
  end

  def encode(claims)
    JWT.encode(claims, secret, algorithm)
  end
end
