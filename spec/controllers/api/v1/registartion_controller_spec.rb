require 'rails_helper'

describe Api::V1::RegistrationsController do
  describe 'create' do

    context 'success' do
      let(:user_params) { { user: {a: 1} } }
      it "should " do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        expect { post :create, params: {user: {email: 'asd@asd.ru', password: 'root0000', password_confirmation: 'root0000'}}}.to change(User, :count).by(1)
        expect(response.body).to eq('')
        expect(response).to be_success
      end
    end
  end
end