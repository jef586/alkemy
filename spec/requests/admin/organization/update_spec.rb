# frozen_string_literal: true

require "rails_helper"

describe "PUT /admin/organization", type: :request do
  let(:endpoint) { put admin_organization_path, params: valid_update_params, as: :json }

  let(:admin_role) { create(:role, name: :admin) }
  let(:regular_role) { create(:role, name: :regular) }

  let(:admin) { create(:user, role: admin_role) }

  before { sign_in(admin) }

  let!(:organization) { create(:organization) }
  let(:valid_update_params) do
    {
      name: "Updated name",
      email: "updated@mail.com",
      address: "updated address 123",
      phone: "33334444"
    }
  end

  context "when user is regular" do
    let(:admin) { create(:user, role: regular_role) }

    it "fails" do
      endpoint
      expect(response).to have_http_status(403)
    end
  end

  context "when user is administrator" do
    it "succeeds" do
      endpoint
      expect(response).to have_http_status(200)
    end

    it "update organization data" do
      endpoint
      expect(data["name"]).to eq(organization.reload.name)
      expect(data["email"]).to eq(organization.reload.email)
      expect(data["address"]).to eq(organization.reload.address)
      expect(data["phone"]).to eq(organization.reload.phone)
    end
  end
end
