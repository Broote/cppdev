#  encoding: utf-8

class SolutionsController < ApplicationController
  load_and_authorize_resource

  def index
    @problem = Problem.find(params[:problem_id])
    @solutions = @problem.solutions

    respond_to do |format|
      format.html # index.html.erb                                                           s
      format.xml { render :xml => @solutions }
    end
  end

  def show
    @problem = Problem.find(params[:problem_id])
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @solution }
    end
  end

  def new
    @user = current_user
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @solution }
    end
  end

  def edit
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.find(params[:id])
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @solution = Solution.new(params[:solution])
    @solution.problem = @problem
    @solution.user = current_user
    respond_to do |format|
      if @solution.save
        format.html { redirect_to(problems_path, :notice => 'Решение отправлено.') }
        format.xml { render :xml => problems_path, :status => :created, :location => @solution }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @problem = Problem.find(params[:problem_id])
    @solution = Solution.find(params[:id])
    respond_to do |format|
      if @solution.update_attributes!(params[:solution])
        format.html { redirect_to([@problem, @solution], :notice => 'Решение изменено.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    @solution.reload
    if params[:solution][:result].nil?
      render :action => 'conflict_edit'
    else
      render :action => 'conflict_show'
    end
  end

  def destroy
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html {
        unless current_user.role == "admin"
          redirect_to(solutions_mine_path)
        else
          redirect_to(solutions_unverified_path)
        end }
      format.xml { head :ok }
    end
  end

  def unverified
    authorize! :unverified, @user
    @solutions = Solution.find(:all, :conditions => ["result = ?", "не проверено",], :order => 'updated_at')
  end

  def verified
    authorize! :verified, @user
    @solutions = Solution.find(:all, :conditions => ["result != ?", "не проверено",], :order => 'updated_at')
  end

  def all
    authorize! :all, @user
    @solutions = Solution.find(:all, :order => 'updated_at')
  end

  def mine
    @user = current_user
    @solutions = Solution.find(:all, :conditions => {:user_id => @user.id}, :order => 'updated_at DESC')
  end

end
