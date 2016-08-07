class Message < ApplicationRecord
  belongs_to :topicable, :polymorphic => true
  belongs_to :sender, :polymorphic => true
end
