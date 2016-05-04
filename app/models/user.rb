class User < ApplicationRecord
  has_secure_password
  has_many :payments
  has_many :uploads
  has_many :funds
end
