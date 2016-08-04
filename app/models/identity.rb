# == Schema Information
#
# Table name: identities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  provider    :string
#  provider_id :string
#  token       :string
#  expires_at  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Identity < ApplicationRecord
  belongs_to :user
end
