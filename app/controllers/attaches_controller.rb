class AttachesController < ApplicationController
  load_and_authorize_resource
  
  def index
    #@attachs = attach.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachs }
    end
  end

  def show
    #@attach = attach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attach }
    end
  end

  def new
    #@attach = attach.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attach }
    end
  end

  def edit
  end

  def create
    #@attach = attach.new(params[:post])
    #@post.user=current_user
    #@attached_file = AttachedFiles.new(params[:attached_file])
    #@attached_file.parent_id=@post.id
    #@attached_file.parent_type="post"
    #@attached_file.save
    #debugger
    respond_to do |format|
      if @attach.save
        format.html { redirect_to(@attach, :notice => 'attach was successfully created.') }
        format.xml  { render :xml => @attach, :status => :created, :location => @attach }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attach.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #@attach = attach.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @attach.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
