class WelcomeController < ApplicationController
  layout "profile", :only => [ :profile ]
  
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
  
  def update_profile
    #raise params.inspect
    @user = current_user
    @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name], avatar: params[:user][:avatar])
    a = Geocoder.search(params[:location])
    address = a.first   
    Location.create( lattitude: address.latitude, longtitude: address.longitude, city:  address.city, user_id: current_user.id)
    redirect_to profile_path
  end
  
end
