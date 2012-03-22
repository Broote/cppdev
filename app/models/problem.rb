class Problem < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true
end
