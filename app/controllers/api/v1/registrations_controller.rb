class Api::V1::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    # byebug
    if resource.persisted?
      if resource.active_for_authentication?
        render json: resource
      else
        render json: resource.errors.messages, status: :unprocessable_entity
      end
    else
      render json: resource.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
    }, status: :bad_request
  end
end