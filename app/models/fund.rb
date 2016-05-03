class Fund < ApplicationRecord
  belongs_to :user
  has_many :payments


  first_user = User.where(:email => 'hello@newsoundforjapan.com').first_or_create(:password => 'hello', :password_confirmation => 'hello')
  Fund.where(:id => 1, :name => 'The Sound Check', :user_id => first_user.id).first_or_create
end
