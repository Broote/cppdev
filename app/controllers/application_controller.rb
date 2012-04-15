#  encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization

  #before_filter :set_charset
  helper :all

  def set_charset
    @headers["Content-Type"] = "text/html; charset=utf-8"
  end

  #TODO
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
