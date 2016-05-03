class Fund < ApplicationRecord
  belongs_to :user
  has_many :payments

  Fund.where(:id => 1, :name => 'The Sound Check').first_or_create

end
