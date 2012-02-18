#  encoding: utf-8
class Solution < ActiveRecord::Base
  #ZACHTENO = 'зачтено'
  belongs_to :problem
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true
  before_save do |record|
    if record.result == 'зачтено' #Solution::ZACHTENO
      if record.verified == false
        @problem = record.problem
        @user = record.user
        @user.points += @problem.points
        @user.save
      end
      record.verified = true
    else
      if record.verified == true
        @user = record.user
        @problem = record.problem
        @user.points -= @problem.points
        @user.save
      end
      record.verified = false
      return true
    end
  end
end

