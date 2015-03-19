class SessionsController < Devise::SessionsController
  respond_to :js


  def create
   # raise params.inspect 
   super
  end
  
  

  
end
