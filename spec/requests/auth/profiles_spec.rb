# frozen_string_literal: true

require "rails_helper"


RSpec.describe "USER PROFILE", type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 10) }
  let!(:user_id) { users.first.id }

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
