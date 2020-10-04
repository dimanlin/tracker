require 'rails_helper'

describe Api::V1::RegistrationsController do
  describe 'create' do
    context 'user' do
      context 'with valid params' do
        let(:user_params) { FactoryBot.attributes_for(:user) }
        it "should be created user" do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          expect { post :create, params: { user: user_params }}.to change(User, :count).from(0).to(1)
        end
      end

      context 'with empty params' do
        it "return validation errors" do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          expect { post :create, params: { user: {} }}.to change(User, :count).by(0)
          expect(response.body).to eq("{\"email\":[\"can't be blank\"],\"password\":[\"can't be blank\"],\"name\":[\"can't be blank\"]}")
        end
      end
    end
  end
end