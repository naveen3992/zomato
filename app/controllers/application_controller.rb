class ApplicationController < ActionController::Base
  protect_from_forgery
  
#before_filter :authenticate_user!

  #include SessionsHelper



  def after_sign_in_path_for(resource)
    
    if current_user.rowner
      userrest_restaurants_path
    else
      "users/#{current_user.id}"
    end
  
  end

end




