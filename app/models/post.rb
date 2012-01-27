class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :attachments, :as => :uploadable
  accepts_nested_attributes_for :attachments, :allow_destroy => true

  attr_accessible :attachments_attributes
  attr_accessible :title, :body, :commentable, :uploadable, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at, :attachment_created_at, :attachment_uploadable_id, :attachment_uploadable_type
end
