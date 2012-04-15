class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true

  before_save do |post|
    if post.user.role != "admin"
      post.commentable = true
    end
  end
end
