# frozen_string_literal: true

require "rails_helper"

describe "GET /api/v1/organization", type: :request do
  let(:endpoint) { get api_v1_organization_url, as: :json }

  let(:user) { create(:user) }
  let!(:organization) { create(:organization) }

  context "when user is regular" do
    it "has http status 200" do
      endpoint
      expect(response).to have_http_status(200)
    end

    it "returns the organization params" do
      endpoint
      expect(data["name"]).to eq(organization.name)
      expect(data["email"]).to eq(organization.email)
      expect(data["address"]).to eq(organization.address)
      expect(data["phone"]).to eq(organization.phone)
    end
  end
end
