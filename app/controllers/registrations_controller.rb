class RegistrationsController < Devise::RegistrationsController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    respond_to :json
  
    def create
      build_resource(sign_up_params)
  
      resource.save
      render_resource(resource)
    end
  end