class Upload < ActiveRecord::Base
  scope :images, lambda { where("mime_type LIKE 'image%'") }
  scope :not_images, lambda { where("mime_type NOT LIKE 'image%'") }
  scope :free, lambda { all }

  belongs_to :user
  belongs_to :attachable, :polymorphic => true
  dragonfly_accessor :file

  acts_as_list :scope => :user
end
