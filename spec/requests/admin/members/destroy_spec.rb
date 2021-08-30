# frozen_string_literal: true

require "rails_helper"

describe "DELETE /admin/members/:id", type: :request do
  let(:endpoint) { delete admin_member_path(member) }
  let(:member) { create(:member) }

  context "when user is an admin" do
    let(:admin) { create(:user) }

    before { sign_in(admin) }

    context "and the member exists" do
      before do
        member
      end

      it "has an HTTP status 204" do
        endpoint
        expect(response).to have_http_status(204)
      end
      it "returns an empty response body" do
        endpoint
        expect(response.body).to be_empty
      end
      it "destroys ONE member" do
        expect { endpoint }.to change(Member, :count)
      end
    end

    context "and the member doesn't exists" do
      let(:endpoint) { delete admin_member_path(240) }

      it "has an HTTP status 404" do
        endpoint
        expect(response).to have_http_status(404)
      end
      it "returns error message: 'Couldn't find Member...'" do
        endpoint
        expect(body_json["error"]).to match(/Couldn't find Member/)
      end
      it "Member.count doesn't change" do
        expect { endpoint }.not_to change(Member, :count)
      end
    end
  end

  context "when user is a regular" do
    let(:regular) { create(:user, role: nil) }
    before do
      sign_in(regular)
      endpoint
    end

    it "returns an HTTP status 403" do
      expect(response).to have_http_status(403)
    end
    it "returns error message: 'Ups.. you shouldn't be here'" do
      expect(body_json["not_authorized"]).to eq("Ups.. you shouldn't be here")
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
