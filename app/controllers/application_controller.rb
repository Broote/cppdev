#  encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization

  #before_filter :set_charset

  def set_charset
    @headers["Content-Type"] = "text/html; charset=utf-8"
  end

  #TODO
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @user = current_user
    @solutions = Solution.find(:all, :conditions => {:user_id => @user.id, :result => "не проверено"})
  end

end
