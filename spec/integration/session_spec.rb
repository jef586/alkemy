# frozen_string_literal: true

# spec/integration/blogs_spec.rb
require "swagger_helper"

describe "Auth API" do
  path "/auth/login", swagger_doc: "v1/auth_api.json" do
    post "login a user" do
      tags "Authentication"
      consumes "application/json"
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }

        },
        required: [ "email", "password" ]
      }

      response "200", "ok" do
        let(:user) { { "email": "adminer@admin.com", "password": "123456" } }
        run_test!
      end

      response "401", ":Unauthorized" do
        let(:user) { {  error: "unauthorized" } }
        run_test!
      end
    end
  end
end
