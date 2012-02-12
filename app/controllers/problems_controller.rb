class ProblemsController < ApplicationController
  load_and_authorize_resource

  def index
    #@problems = Problem.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @problems }
    end
  end

  def show
    #@problem = Problem.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @problem }
    end
  end

  def new
    #@problem = Problem.new
    @problem.attaches = [Attach.new()]
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @problem }
    end
  end

  def edit
    #@problem = Problem.find(params[:id])
  end

  def create
    #@problem = Problem.new(params[:problem])
    respond_to do |format|
      if @problem.save
        format.html { redirect_to(@problem, :notice => 'Problem was successfully created.') }
        format.xml { render :xml => @problem, :status => :created, :location => @problem }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #@problem = Problem.find(params[:id])
    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to(@problem, :notice => 'Problem was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    #@problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to(problems_url) }
      format.xml { head :ok }
    end
  end
end
