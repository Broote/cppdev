#  encoding: utf-8
class Solution < ActiveRecord::Base
  #ZACHTENO = 'зачтено'
  belongs_to :problem
  belongs_to :user
  has_many :attaches, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :attaches, :allow_destroy => true

  before_create do |record|
    record.points_got = 0
    record.result="не проверено"
  end

  before_save do |record|
    @problem = record.problem
    @user = record.user
    if record.result == 'зачтено' && record.updated_at <= @problem.deadline
      # если задача засчитана, то добавляем количество баллов, которое еще не добавлено до нужного уровня
      if record.points
        @user.points += record.points - record.points_got
        record.points_got = record.points
      else
        @user.points += @problem.points - record.points_got
        record.points_got = @problem.points
      end
      @user.save
    elsif record.result != 'зачтено' && record.points_got != 0 && (!record.points_got.nil?)
      @user.points -= record.points_got
      record.points_got = 0
    end
    @user.save
  end

end