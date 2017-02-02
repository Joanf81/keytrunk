require 'jwt'

class Authentication

  ALGORITHM = 'HS256'

  def self.encode(payload)
    JWT.encode(
        payload,
        auth_secret,
        ALGORITHM)
  end

  private
  def self.auth_secret
    ENV["AUTH_SECRET"]
  end

end