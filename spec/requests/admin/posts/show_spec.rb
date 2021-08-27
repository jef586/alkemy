# frozen_string_literal: true

require "rails_helper"

describe "GET /admin/posts/:id", type: :request do
  let(:endpoint) { get admin_post_path(post) }
  let(:post) { create(:post) }

  context "when user is an admin" do
    let(:admin) { create(:user) }

    before { sign_in(admin) }

    context "and the post exists" do
      before do
        endpoint
      end

      it "has an HTTP status 200" do
        expect(response).to have_http_status(200)
      end
      it "returns the correct id" do
        expect(data["id"]).to eq(post.id)
      end
      it "returns the correct name" do
        expect(data["name"]).to eq(post.name)
      end
      it "returns the correct content" do
        expect(data["content"]).to eq(post.content)
      end
    end

    context "and the post doesn't exists" do
      let(:endpoint) { get admin_post_path(240) }

      before { endpoint }
      it "has an HTTP status 404" do
        expect(response).to have_http_status(404)
      end
      it "returns error message: 'Couldn't find Post...'" do
        expect(body_json["error"]).to match(/Couldn't find Post/)
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
