# frozen_string_literal: true

require "rails_helper"

describe "POST /api/v1/contacts", type: :request do
  let(:endpoint) { post api_v1_contacts_path, params: correct_params, as: :json }
  let(:correct_params) { { name: "Create contact name", email: "create@email.com", phone_number: "11112222" } }
  let(:regular_user) { create(:user, role_id: !1) }
    
  context "the parameters are correct" do
    before { get "/api/v1/contacts", headers: { "Authorization": sign_in(regular_user) } }
    
    it "returns an HTTP status 201" do
        endpoint
        expect(response).to have_http_status(201)
    end
  
    it "saves ONE contact" do
      expect { endpoint }.to change(Contact, :count)
    end

    it "succesfully creates an contact with the correct name" do
      endpoint
      expect(data["name"]).to eq(correct_params[:name])
    end

    it "succesfully creates an contact with the correct content" do
      endpoint
      expect(data["email"]).to eq(correct_params[:email])
    end

    it "succesfully creates an contact with the correct content" do
      endpoint
      expect(data["phone_number"]).to eq(correct_params[:phone_number])
    end
  end

    context "some parameter is invalid or missing" do
      before { get "/api/v1/contacts", headers: { "Authorization": sign_in(regular_user) } }
      before { post api_v1_contacts_path, params: { name: correct_params[:name] }, as: :json }

      it "returns an HTTP status 422" do
        expect(response).to have_http_status(422)
      end

      it "returns errors" do
        expect(body_json).to include("errors")
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
