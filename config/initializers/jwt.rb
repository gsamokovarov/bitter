Token.secret = ENV['JWT_SECRET'].presence ||
  Rails.configuration.secret_key_base ||
  'test1234'

if algorithm = ENV['JWT_ALGORITHM'].presence
  Token.algorithm = algorithm 
end
