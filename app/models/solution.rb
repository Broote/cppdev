#  encoding: utf-8
class Solution < ActiveRecord::Base
  #ZACHTENO = 'зачтено'
  belongs_to :problem
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true
  before_save do |record|
    @problem = record.problem
    @user = record.user
    if record.result == 'зачтено' #Solution::ZACHTENO
      if record.verified == false && record.updated_at <= @problem.deadline
        if record.points
          @user.points += record.points
        else
          @user.points += @problem.points
        end
        @user.save
      end
      record.verified = true
    else
      if record.verified == true && record.updated_at <= @problem.deadline
        if record.points
          @user.points -= record.points
        else
          @user.points -= @problem.points
        end
        @user.save
      end
      record.verified = false
      return true
    end
  end
end