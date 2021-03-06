module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
 def format_date(time)
    time = time.to_date if time
  	time.strftime("%d %b, %Y") if time
	end
	
end

