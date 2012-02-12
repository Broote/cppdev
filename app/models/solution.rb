class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true
end
