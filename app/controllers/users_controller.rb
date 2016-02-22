class UsersController < ApplicationController
 before_filter :authenticate_user!
  
  def index
  	if user_signed_in?
    redirect_to todos_path
    end
  end

   
 

end
