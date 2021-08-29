# frozen_string_literal: true

require "rails_helper"

describe "POST /admin/testimonials", type: :request do
  let(:endpoint) { post admin_testimonials_path, params: correct_params, as: :json }
  let(:correct_params) { { name: "Create testimonial name", content: "Create testimonial content" } }

  context "when user is an admin" do
    let(:admin) { create(:user) }
    before do
      sign_in(admin)
    end

    context "and the parameters are correct" do
      it "returns an HTTP status 201" do
        endpoint
        expect(response).to have_http_status(201)
      end
      it "saves ONE testimonial" do
        expect { endpoint }.to change(Testimonial, :count)
      end
      it "succesfully creates an testimonial with the correct name" do
        endpoint
        expect(data["name"]).to eq(correct_params[:name])
      end
      it "succesfully creates an testimonial with the correct content" do
        endpoint
        expect(data["content"]).to eq(correct_params[:content])
      end
    end

    context "but some parameter is invalid or missing" do
      before { post admin_testimonials_path, params: { name: correct_params[:name] }, as: :json }

      it "returns an HTTP status 422" do
        expect(response).to have_http_status(422)
      end
      it "returns errors" do
        expect(body_json).to include("errors")
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
