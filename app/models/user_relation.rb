# == Schema Information
#
# Table name: user_relations
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  relative_id   :integer
#  relative_type :string
#  relation      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserRelation < ApplicationRecord
  belongs_to :relative, :polymorphic => true
  belongs_to :user
  
  scope :is, -> { where(:relation => 'is') }
end
