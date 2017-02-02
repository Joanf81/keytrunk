class Authorization

  ALGORITHM = 'HS256'

  def self.authorize_token(headers)
    if decoded_auth_token(headers).nil?
      nil
    else
      User.find_by_id(decoded_auth_token(headers))
    end
  end

  private

  def self.decoded_auth_token(headers)
    if http_auth_header(headers).nil?
      nil
    else
      if headers['Authorization'].present?
        return decode(headers['Authorization'])['user']
      else
        nil
      end
    end
  end

  def self.http_auth_header(headers)
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      nil
    end
  end

  def self.decode(token)
    JWT.decode(token,
               auth_secret,
               true,
               { algorithm: ALGORITHM }).first
  end

  def self.auth_secret
    ENV["AUTH_SECRET"]
  end
end