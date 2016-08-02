# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ApplicationRecord
  belongs_to :user

  attr_accessor :email, :password, :auth_hash

  def email= (value)
    @email = value
    self.user = User.where(:email => @email).first
  end
  
  def auth_hash= (value)
    @auth_hash = value
    self.user = User.find_or_create_from_auth_hash(@auth_hash)
  end

  validate do
    if @auth_hash
      
    else
      errors.add(:user, 'could not be authenticated') unless user && user.authenticate(password)
    end
  end

end
