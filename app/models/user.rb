class User < ApplicationRecord
    has_many :authentications, dependent: :destroy
    include Clearance::User

    def self.authenticate(username, password)
        if user = User.find_by(username: username)
            user if password.present? && user.authenticated?(password)
        end
      end

    def password_optional?
        true
    end

    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = User.create!(username: auth_hash['extra']['raw_info']['name'], email: auth_hash['extra']['raw_info']['email'])
        user.authentications << authentication
        user
    end

    def fb_token
        x = authentications.where(provider: :facebook).first
        return x.token unless x.nil?
    end
end
