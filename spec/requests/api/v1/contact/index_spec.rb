# frozen_string_literal: true

require "rails_helper"

describe "GET /api/v1/contacts", type: :request do
  let(:regular_user) { create(:user, role_id: !1) }
  let!(:contacts) { create_list(:contact, 10, from_user: regular_user) }

  context "when return all contacts" do
    before { get "/api/v1/contacts", headers: { "Authorization": sign_in(regular_user) } }

    it "returns contacts" do
      expect(data).not_to be_empty
      expect(data.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  context "when user is not logged" do
    before { get "/api/v1/contacts" }

    it "returns status 401" do
      expect(response).to have_http_status(401)
    end

    it "returns error message: 'Nil JSON web token'" do
      expect(body_json["errors"]).to eq("Nil JSON web token")
    end
  end
end
