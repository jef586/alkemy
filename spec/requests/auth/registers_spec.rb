# frozen_string_literal: true

require "rails_helper"

describe "POST /auth/register", type: :request do
  def endpoint
    "/auth/register"
  end
  let(:correct_params) {
    HashWithIndifferentAccess.new(
    first_name: "Jorge",
    last_name: "Latina",
    email: "email123@email.com",
    password: "123456")
  }

  describe "with correct parameters" do
    before(:each) do
      post endpoint, params: correct_params
    end

    it "has http status of 201" do
      expect(response).to have_http_status(201)
    end
    it "saves ONE user" do
      expect(User.count).to eq(1)
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
    it "returns the correct first_name" do
      expect(data["first_name"]).to eq(correct_params["first_name"])
    end
    it "returns the correct last_name" do
      expect(data["last_name"]).to eq(correct_params["last_name"])
    end
    it "returns the correct email" do
      expect(data["email"]).to eq(correct_params["email"])
    end
    it "returns 'regular' as the asigned role" do
      expect(data["role"]).to eq("regular")
    end
  end

  describe "with invalid parameters" do
    it "does not save any user" do
      post endpoint, params: correct_params.merge!({ first_name: "" })
      expect(User.count).to eq(0)
    end
    it "has http status of 422" do
      post endpoint, params: correct_params.merge!({ first_name: "" })
      expect(response).to have_http_status(422)
    end
    it "returns email taken if the email has been taken" do
      post endpoint, params: correct_params
      post endpoint, params: correct_params
      expect(errors["email"]).to include("has already been taken")
    end
    it "returns first_name can't be blank if first_name is missing" do
      post endpoint, params: correct_params.merge!({ first_name: "" })
      expect(errors["first_name"]).to include("can't be blank")
    end
    it "returns last_name can't be blank if last_name is missing" do
      post endpoint, params: correct_params.merge!({ last_name: "" })
      expect(errors["last_name"]).to include("can't be blank")
    end
    it "returns email can't be blank if email is missing" do
      post endpoint, params: correct_params.merge!({ email: "" })
      expect(errors["email"]).to include("can't be blank")
    end
    it "returns password can't be blank if password is missing" do
      post endpoint, params: correct_params.merge!({ password: "" })
      expect(errors["password"]).to include("can't be blank")
    end
  end
end
