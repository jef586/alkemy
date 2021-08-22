# frozen_string_literal: true

require "rails_helper"

describe "POST /auth/login", type: :request do
  def endpoint
    "/auth/login"
  end
  let(:user) { User.create(
    first_name: "Jorge",
    last_name: "Latina",
    email: "email123@email.com",
    password: "123456")
  }
  let(:correct_params) {
    HashWithIndifferentAccess.new(
    email: "email123@email.com",
    password: "123456")
  }

  describe "with correct parameters and an existing user" do
    before(:each) do
      @user = user
      post endpoint,  params: correct_params
    end
    it "has http status of 200" do
      expect(response).to have_http_status(200)
    end
    it "contains a expires_at field" do
      expect(data).to include("expires_at")
    end
    it "the response contains a token" do
      expect(data).to include("token")
    end
    it "and the token is valid" do
      expect(token_user_id(data["token"])).to eq(data["id"])
    end
    it "returns user's first_name" do
      expect(data["first_name"]).to eq(@user.first_name)
    end
    it "returns user's last_name" do
      expect(data["last_name"]).to eq(@user.last_name)
    end
    it "returns user's email" do
      expect(data["email"]).to eq(@user.email)
    end
    it "returns user's role" do
      expect(data["role"]).to eq(@user.role.name)
    end
  end
  describe "with wrong parameters or non existing user" do
    it "wrong email has http status of 401" do
      post endpoint, params: correct_params.merge!({ email: "asdasd@asd.com" })
      expect(response).to have_http_status(401)
    end
    it "wrong email returns unauthorized message" do
      post endpoint, params: correct_params.merge!({ email: "asdasd@asd.com" })
      expect(body_json["error"]).to eq("unauthorized")
    end
    it "wrong password has http status of 401" do
      post endpoint, params: correct_params.merge!({ password: "456213" })
      expect(response).to have_http_status(401)
    end
    it "wrong password returns unauthorized message" do
      post endpoint, params: correct_params.merge!({ password: "456213" })
      expect(body_json["error"]).to eq("unauthorized")
    end  
  end
end