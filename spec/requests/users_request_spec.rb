require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /register' do
    it 'authenticates the user' do
      post '/auth/register', params: { user: { first_name: 'user1', last_name: 'last_name', 
      email: 'email@email.com',
      password: 'password'} }

      expect(response).to have_http_status(:created)
      expect(json).to eq({
                           'id' => User.last.id,
                           'first_name' => 'user1',
                           'token' => AuthenticationTokenService.call(User.last.id)
                         })
    end
  end
end