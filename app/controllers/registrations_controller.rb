class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_up_path_for(resource)
    '/dashboard' # Or :prefix_to_your_route
  end
  
end
