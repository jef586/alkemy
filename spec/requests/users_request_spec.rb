# frozen_string_literal: true

require "rails_helper"


RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 10) }
  let!(:user_id) { users.first.id }


  # INDEX
  describe "GET /users" do
    before { get "/admin/users", headers: { "Authorization": sign_in(user) } }

    it "returns users" do
      expect(data).not_to be_empty
      expect(data.size).to eq(11)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    context "user is not admin" do
      let(:regular_user) { create(:user, role_id: !1) }
      before { get "/admin/users", headers: { "Authorization": sign_in(regular_user) } }
      it "returns status code 403" do
        expect(response).to have_http_status(403)
      end
      it "returns a you shouldnt be here message" do
      expect(response.body).to include("Ups.. you shouldn't be here")
    end
    end
  end

  # UPDATE

  describe "PATCH /api/v1/users/:id" do
      let(:valid_attributes) { { first_name: "Saffron Swords", password: "password" } }

      before { patch "/api/v1/users/#{user_id}", params: valid_attributes, headers: { "Authorization": sign_in(user) } }

      context "when user exists" do
        it "returns status code 200" do
          expect(response).to have_http_status(200)
        end

        it "updates the user" do
          updated_item = User.find(user_id)
          expect(updated_item.first_name).to match(/Saffron Swords/)
        end
      end

      context "when the user does not exist" do
        let(:user_id) { 0 }

        it "returns status code 404" do
          expect(response).to have_http_status(404)
        end
      end
      context "when params are null" do
        let(:valid_attributes) { { first_name: "", password: "" } }
        it "returns status code 422" do
          expect(response).to have_http_status(422)
        end
      end
    end


  # DELETE
  describe "DELETE /users/:id" do
    before { delete "/api/v1/users/#{user_id}", headers: { "Authorization": sign_in(user) } }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  describe "NOT DELETE when user is not itself" do
          let(:impostor_user) { create(:user, role_id: !1) }

          before { delete "/api/v1/users/#{user_id}", headers: { "Authorization": sign_in(impostor_user) } }

          it "returns status code 403" do
            expect(response).to have_http_status(403)
          end
          it "returns a you shouldnt be here message" do
          expect(response.body).to include("Ups.. you shouldn't be here")
        end
        end


  # SHOW PROFILE

  describe "GET /auth/me" do
    before { get "/auth/me", headers: { "Authorization": sign_in(user) } }

    it "returns current user profile" do
      expect(response).to have_http_status(200)
      expect(data).to eq({
                          "id" => user.id,
                          "first_name" => user.first_name,
                          "last_name" => user.last_name,
                          "email" => user.email,
                          "role" => user.role.name
                        })
    end
  end
end
