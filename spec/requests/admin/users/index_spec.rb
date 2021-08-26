# frozen_string_literal: true

require "rails_helper"

describe "GET /admin/users", type: :request do
  let!(:user) { create(:user) }
  let!(:users) { create_list(:user, 10) }

  context "when return all users" do
    before { get "/admin/users", headers: { "Authorization": sign_in(user) } }

    it "returns users" do
      expect(data).not_to be_empty
      expect(data.size).to eq(11)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    context "when user is not admin" do
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
end
