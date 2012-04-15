#  encoding: utf-8

module ApplicationHelper
  def sol_number
    @user = current_user
    @solutions = Solution.find(:all, :conditions => {:user_id => @user.id, :result => "не проверено"})
    unless @solutions.nil?
      return @solutions.count
    else
      return 0
    end
  end
end