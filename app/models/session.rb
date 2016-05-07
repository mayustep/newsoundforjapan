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


  attr_accessor :email, :password

  def email= (value)
    @email = value
    self.user = User.where(:email => @email).first
  end

  validate do
    errors.add(:user, 'could not be authenticated') unless user && user.authenticate(password)
  end
end
