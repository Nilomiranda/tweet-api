class JsonWebToken
  # secret to encode and decode the token
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, expiration = 24.hours_from_now)
    # set token's expiration to 24 hours from token creation time
    payload[:ext] = expiration.to_i

    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end
end