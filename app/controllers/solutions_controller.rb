class SolutionsController < ApplicationController

  def index
    @solutions = Solution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @solutions }
    end
  end

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @solution }
    end
  end

  def new
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
    @solution.user = current_user
    @solution.problem = @problem
    respond_to do |format|
      if @solution.save
        format.html { redirect_to(problems_path, :notice => 'Solution was successfully sent.') }
        format.xml { render :xml => problems_path, :status => :created, :location => @solution }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html { redirect_to(@solution, :notice => 'Solution was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to(solutions_url) }
      format.xml { head :ok }
    end
  end
end
