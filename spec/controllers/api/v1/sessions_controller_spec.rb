require 'rails_helper'

describe Api::V1::SessionsController do
  describe 'create session' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context 'success' do
      let(:user) { FactoryBot.create(:user) }
      it 'return token' do
        pattern = { email: user.email,
                    authentication_token: user.authentication_token,
                    name: user.name }

        post :create, params: { user: { email: user.email, password: 'root0000' } }, format: :json
        expect(response.body).to match_json_expression(pattern)
      end
    end

    context 'invalid' do
      let(:user_params) { { email: 'fake@email.com', password: 'root0000' } }
      it 'return token' do
        pattern = { error: "Invalid Email or password." }
        post :create, params: { user: user_params }, format: :json
        expect(response.body).to match_json_expression(pattern)
      end
    end
  end
end