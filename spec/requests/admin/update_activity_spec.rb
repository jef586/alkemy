# frozen_string_literal: true

require "rails_helper"

describe "PUT /admin/activities/:id", type: :request do
  let(:endpoint) { put admin_activity_path(activity), params: correct_params, as: :json }
  let(:correct_params) { { name: "Updated activity name", content: "Updated activity content" } }
  let(:activity) { create(:activity) }

  context "when user is an admin" do
    let(:admin) { create(:user) }
    before do
      sign_in(admin)
    end

    context "and the parameters are correct" do
      before { endpoint }

      it "returns an HTTP status 200" do
        expect(response).to have_http_status(200)
      end
      it "succesfully updates the name" do
        expect(data["name"]).to eq(correct_params[:name])
      end
      it "succesfully updates the content" do
        expect(data["content"]).to eq(correct_params[:content])
      end
    end

    context "but the activity doesn't exist" do
      before { put admin_activity_path(200), params: correct_params, as: :json }

      it "returns an HTTP status 404" do
        expect(response).to have_http_status(404)
      end
      it "returns error message: 'Couldn't find Activity...'" do
        expect(body_json["error"]).to match(/Couldn't find Activity/)
      end
    end

    # context "but the request is invalid" do
    #   before { put admin_activity_path(activity), params: "asdasd" }

    #   it "returns a status 400" do
    #     expect(response).to have_http_status(400)
    #   end
    # end
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
