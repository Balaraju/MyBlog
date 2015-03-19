class RegistrationsController < Devise::RegistrationsController
  respond_to :js
  def create
   super
  end
  
end
