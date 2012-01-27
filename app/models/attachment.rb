class Attachment < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  has_attached_file :upload
end
