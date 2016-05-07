# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  amount     :integer
#  currency   :string
#  name       :string
#  fund_id    :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_name :string
#  image_uid  :string
#

class Goal < ApplicationRecord
  include Translatable

  belongs_to :fund
  accepts_translations_for :description
  dragonfly_accessor :image

end
