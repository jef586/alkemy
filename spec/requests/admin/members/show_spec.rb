# frozen_string_literal: true

require "rails_helper"

describe "GET /admin/members/:id", type: :request do
  let(:endpoint) { get admin_member_path(member) }
  let(:member) { create(:member) }

  context "when user is an admin" do
    let(:admin) { create(:user) }

    before { sign_in(admin) }

    context "and the member exists" do
      before do
        endpoint
      end

      it "has an HTTP status 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the correct id" do
        expect(data["id"]).to eq(member.id)
      end
      it "returns the correct name" do
        expect(data["name"]).to eq(member.name)
      end
    end

    context "and the member doesn't exists" do
      let(:endpoint) { get admin_member_path(240) }

      before { endpoint }
      it "has an HTTP status 404" do
        expect(response).to have_http_status(404)
      end
      it "returns error message: 'Couldn't find Meber...'" do
        expect(body_json["error"]).to match(/Couldn't find Member/)
      end
    end
  end

  context "when user is a regular" do
    let(:regular) { create(:user, role: nil) }
    before do
      sign_in(regular)
      endpoint
    end

    it "returns an HTTP status 200" do
      expect(response).to have_http_status(200)
    end
  end

  context "when no token is provided" do
    before { endpoint }

    it "returns an HTTP status 401" do
      expect(response).to have_http_status(401)
    end
    it "returns error message: 'Nil JSON web token'" do
      expect(body_json["errors"]).to eq("Nil JSON web token")
    end
  end
end
