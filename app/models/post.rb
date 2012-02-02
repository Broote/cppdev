class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy

  #attr_accessible :title, :body, :commentable, :upfile
  accepts_nested_attributes_for :attaches
end
