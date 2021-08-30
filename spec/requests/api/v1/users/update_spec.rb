# frozen_string_literal: true

require "rails_helper"

describe "PUT api/v1/users/:id", type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 10) }
  let!(:user_id) { users.first.id }

  context "when update params are valid" do
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
end
