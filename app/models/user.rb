class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  has_many :posts

  def self.from_omniauth(omniauth_params)
    # TODO: what if 2 providers have same email?
    # TODO: what if email is not present in the omniauth payload?
    provider = omniauth_params.provider
    uid = omniauth_params.uid

    user = User.find_or_initialize_by(provider:, uid:)
    user.email = omniauth_params.info.email
    user.name = omniauth_params.info.name
    user.image = omniauth_params.info.image
    user.save
    user
  end
end