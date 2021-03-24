class JsonWebToken
  # secret to encode and decode the token
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, expiration = 24.hours.from_now)
    # set token's expiration to 24 hours from token creation time
    payload[:exp] = expiration.to_i

    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    puts("TOKEN", token)
    # get payload: first element in decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

    # rescue all decode errors

  rescue JWT::DecodeError => e
    puts("DECODE ERROR", e)
    raise ExceptionHandler::InvalidToken, e.message
  end
end