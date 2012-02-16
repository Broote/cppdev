#  encoding: utf-8
class Solution < ActiveRecord::Base
  ZACHTENO = 'затено'
  belongs_to :problem
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true

  before_save do |record|
    if record.result == Solution::ZACHTENO
      record.verified = true
    end
  end
end