# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  locale          :string
#  name            :string
#  image_uid       :string
#

class User < ApplicationRecord
  dragonfly_accessor :image
  
  has_secure_password
  has_many :payments
  has_many :uploads
  has_many :funds
  has_many :identities
  has_many :user_relations
  
  attr_accessor :bootstrap_artist_id
  
  def self.find_or_create_from_auth_hash(auth_hash, override_user = nil)
    identity = Identity.where(:provider => auth_hash[:provider], :provider_id => auth_hash[:uid]).first_or_create do |identity|
      identity.user = override_user || User.where(:email => auth_hash[:info][:email]).first_or_create(:password => SecureRandom.base64(10)[0..7])
    end
    identity.token = auth_hash[:credentials][:token]
    identity.expires_at = auth_hash[:credentials][:expires_at] || auth_hash[:credentials][:expires]
    identity.save
    user = identity.user
    user.name ||= auth_hash[:info][:name]
    user.image_url ||= auth_hash[:info][:image]
    user.save
    user
  end

  def admin?
    self.id == 1 || self.id == 2 || self.id == 3
  end

  def display_name
    self.name || self.email.split('@')[0]
  end
  
  def can_accept_payment?
    self.identities.stripe.any?
  end

end
