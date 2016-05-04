class Session < ApplicationRecord
  belongs_to :user


  attr_accessor :email, :password

  def email= (value)
    @email = value
    self.user = User.where(:email => @email).first
  end

  validate do
    errors.add(:user, 'could not be authenticated') unless user && user.authenticate(password)
  end
end
