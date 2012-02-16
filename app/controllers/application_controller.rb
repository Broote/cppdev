class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :set_charset

  def set_charset
    @headers["Content-Type"] = "text/html; charset=utf-8"
  end

  #TODO
  if false
    rescue_from CanCan::AccessDenied do |exception|
      puts "lallala"
      flash[:error] = "Access denied."
      #redirect_to '/users/sign_in'
    end
  end
end
