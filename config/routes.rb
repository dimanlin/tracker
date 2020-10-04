Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: 'registrations' }
  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do
  #
  #   end
  # end
  #
  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do
  #
  #   end
  # end
  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do
  #     devise_scope :user do
  #       devise_for :users, path: nil
  #     end
  #   end
  # end
  # devise_for :users, path: nil
  # devise_scope :api do
  #   devise_scope :v1 do
  #
  #   end
  # end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end
  end
end
