require 'jwt'

module JsonWebToken

    extend ActiveSupport::Concern

    SECRET_KEY = Rails.application.secrets.secret_key_base

    def jwt_encode(payload, exp = 7.days.from_now)
        payload[:exp] = exp.to_i
        
        payload.delete(:password_digest)
        payload.delete(:password)
        payload.delete(:organization)
        
        token = "Bearer " + JWT.encode(payload, SECRET_KEY)

    end

    def jwt_decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]

        HashWithIndifferentAccess.new decoded
    end

    private 
end