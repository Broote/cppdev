#  encoding: utf-8

class PostsController < ApplicationController
 load_and_authorize_resource :except => [:news]

  def index
    @posts = Post.find(:all, :order => "updated_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @posts }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @post }
    end
  end

  def new
    #@post = Post.new
    @post.attaches = [Attach.new()]
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @post }
    end
  end

  def edit
    #@post = Post.find(params[:id])
    #unauthorized! if cannot? :update, @post
  end

  def create
    #@post = Post.new(params[:post])
    @post.user = current_user
    @post.user=current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Сообщение создано.') }
        format.xml { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #@post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Сообщение изменено.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml { head :ok }
    end
  end

  def news
    @news = Post.find(:all, :conditions => {:news => true}, :order => "created_at DESC")
    authorize! :read, Post
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @posts }
    end
  end
end
