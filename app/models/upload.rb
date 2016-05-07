# == Schema Information
#
# Table name: uploads
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  file_name       :string
#  file_uid        :string
#  mime_type       :string
#  through         :string
#  bytes           :integer
#  attachable_id   :integer
#  attachable_type :string
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Upload < ActiveRecord::Base
  scope :images, lambda { where("mime_type LIKE 'image%'") }
  scope :not_images, lambda { where("mime_type NOT LIKE 'image%'") }
  scope :free, lambda { all }

  belongs_to :user
  belongs_to :attachable, :polymorphic => true, :optional => true
  dragonfly_accessor :file

  acts_as_list :scope => :user
end
