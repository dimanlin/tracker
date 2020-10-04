class Api::V1::SessionsController < Devise::SessionsController
  clear_respond_to
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource.attributes.slice('email', 'authentication_token', 'name').to_json, location: after_sign_in_path_for(resource)
  end
end