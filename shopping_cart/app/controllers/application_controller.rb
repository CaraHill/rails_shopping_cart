class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    sign_in_url = new_customer_session_url
    referrer = session[:referrer]
    if referrer == sign_in_url
      super
    else
      stored_location_for(resource) || referrer || root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

end
