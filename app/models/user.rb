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
#

class User < ApplicationRecord
  has_secure_password
  has_many :payments
  has_many :uploads
  has_many :funds


end
