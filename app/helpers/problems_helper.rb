module ProblemsHelper
  def my_sol_count(problem)
    @solutions = Solution.find(:all, :conditions => {:user_id => @user.id, :problem_id => problem.id})
    return @solutions.count
  end
end
