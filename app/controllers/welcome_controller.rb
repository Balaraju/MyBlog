class WelcomeController < ApplicationController
  def index
  end
  
  def create_profile
    @user = current_user
    if params.present?
      
    end
  end
  
  def edit_profile
    @user = current_user
  end
  
  def profile
    @user = current_user 
  end
  
end
