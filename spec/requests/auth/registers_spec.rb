# frozen_string_literal: true

require "rails_helper"

describe "POST /auth/register", type: :request do
  let(:endpoint) { post auth_register_url, params: correct_params, as: :json }

  let(:correct_params) do
    {
      first_name: "Jorge",
      last_name: "Latina",
      email: "jlatina@gmail.com",
      password: "123456"
    }
  end

  context "when user want register with correct parameters" do
    it "has http status of 201" do
      endpoint
      expect(response).to have_http_status(201)
    end

    it "saves ONE user" do
      expect { endpoint }.to change(User, :count)
    end

    it "contains a expires_at field" do
      endpoint
      expect(data).to include("expires_at")
    end

    it "the response contains a token" do
      endpoint
      expect(data).to include("token")
    end

    it "and the token is valid" do
      endpoint
      expect(token_user_id(data["token"])).to eq(data["id"])
    end

    it "returns the correct first_name" do
      endpoint
      expect(data["first_name"]).to eq(correct_params[:first_name])
    end

    it "returns the correct last_name" do
      endpoint
      expect(data["last_name"]).to eq(correct_params[:last_name])
    end

    it "returns the correct email" do
      endpoint
      expect(data["email"]).to eq(correct_params[:email])
    end

    it "returns 'regular' as the asigned role" do
      endpoint
      expect(data["role"]).to eq("regular")
    end
  end

  context "when user want register with invalid parameters" do
    context "but first name is null" do
      before do
        correct_params[:first_name] = nil
      end

      it "does not save any user" do
        expect { User }.not_to change(User, :count)
      end

      it "has http status of 422" do
        endpoint
        expect(response).to have_http_status(422)
      end
    end

    context "but the email already exists" do
      before do
        create(:user, email: correct_params[:email])
      end

      it "returns email taken if the email has been taken" do
        endpoint
        expect(response).to have_http_status(422)
      end
    end
  end
end
