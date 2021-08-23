require 'rails_helper'



RSpec.describe 'Users', type: :request do

   Role.create!(:name "administrator")
  # let!(:role) {create(:name:"administrator")}
  let!(:user) { create(:user, role: "administrator") }
  let!(:users) { create_list(:user, 10) }
  



  #INDEX

  describe 'GET /users' do
   
    before { get '/admin/users', headers:{ "Authorization": sign_in(user)} }

    it 'returns users' do
    10.times do
     User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
end
      
      expect(data).not_to be_empty
      expect(data.size).to eq(11)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

# UPDATE

describe 'PATCH /api/v1/users/:id' do
    let(:valid_attributes) { { first_name: 'Saffron Swords' } }

    # before { patch "/api/v1/users/#{user_id}", params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

     before { patch "/api/v1/users/#{user_id}"}

    context 'when user exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the user' do
        updated_item = User.find(user_id)
        expect(updated_item.first_name).to match(/Saffron Swords/)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("unprocessable_entity")
      end
    end
  end

  #DELETE
describe 'DELETE /users/:id' do
    # before { delete "/api/v1/users/#{user_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

     before { delete "/api/v1/users/#{user_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end

  # describe 'POST /register' do

  #   it 'authenticates the user' do

  #     user = user

  #     post '/auth/register'
  #     # ,
      
  #     # params: { first_name: 'user1', last_name: 'last_name', 
  #     # email: 'email@email.com',
  #     # password: 'password'}

  #     #   post '/auth/register', params: { user: { first_name: 'user1', last_name: 'last_name', 
  #     # email: 'email@email.com',
  #     # password: 'password'} }

  #     expect(response).to have_http_status(:created)
  #     expect(data).to eq({
  #                         'id' => user.id,
  #                         'first_name' => user.first_name,
  #                         'last_name' => user.last_name,
  #                         'email' => user.email,
  #                         'expires_at'=> time = Time.now + 24.hours.to_i,
  #                         'role' => user.role,
  #                         'token' => sign_in(user)
  #                       })
  #   end
  # end