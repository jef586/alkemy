# frozen_string_literal: true

require "rails_helper"

describe "GET /api/v1/organization", type: :request do
  def endpoint_show
    "/api/v1/organization"
  end

  def user_regular
    FactoryBot.create(:user)
  end

  let!(:organization) { create(:organization) }

  describe "When user is regular" do
    it "has http status 200" do
      get endpoint_show
      expect(response).to have_http_status(200)
    end

    it "returns the organization params" do
      get endpoint_show
      expect(data["name"]).to eq(organization.name)
      expect(data["email"]).to eq(organization.email)
      expect(data["address"]).to eq(organization.address)
      expect(data["phone"]).to eq(organization.phone)
    end
  end
end

describe "PATCH /admin/organization", type: :request do
  def endpoint_update
    "/admin/organization"
  end

  let!(:user) { create(:user) }
  let!(:organization) { create(:organization) }
  let!(:valid_update_params) { { name: "Updated name", email: "updated@mail.com", address: "updated address 123", phone: "33334444" } }

  describe "when user is regular" do
    it "has status unauthorized" do
      patch endpoint_update
      expect(response).to have_http_status(401)
    end
  end

  describe "when user is administrator" do
    before { patch "/admin/organization", params: valid_update_params, headers: { "Authorization": sign_in(user) } }

    it "Admin get status 200" do
      expect(response).to have_http_status(200)
    end

    it "Admin try to update data" do
      ong_updated = Organization.first
      expect(data["name"]).to eq(ong_updated.name)
      expect(data["email"]).to eq(ong_updated.email)
      expect(data["address"]).to eq(ong_updated.address)
      expect(data["phone"]).to eq(ong_updated.phone)
    end
  end
end
