# frozen_string_literal: true

require "swagger_helper"

describe "Contacts API", type: :request  do
  # API V1 ENDPOINTS

  path "/api/v1/contacts", swagger_doc: "v1/api_v1.json" do
    get "Show all contacts" do
      tags "Contacts"
      produces "application/json"

      response "200", "Show all contacts" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            phone_number: { type: :string },
            email: { type: :string }
          },
          required: ["name", "phone_number", "email"]
        run_test!
      end

      response "401", "Unauthorized. Token is not provided" do
        run_test!
      end

      response "403", "User without permissions" do
        run_test!
      end

      response "422", "Parameter invalid or missing" do
        run_test!
      end
    end
  end

  path "/api/v1/contacts", swagger_doc: "v1/api_v1.json" do
    post "Create a contact" do
      tags "Contacts"

      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          phone_number: { type: :string },
          email: { type: :string }
        },
        required: ["name", "phone_number", "email"]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            phone_number: { type: :string },
            email: { type: :string }
          },
          required: ["name", "phone_number", "email"]
        run_test!
      end

      response "401", "Unauthorized. Token is not provided" do
        run_test!
      end

      response "403", "User without permissions" do
        run_test!
      end

      response "422", "Activity doesn't exist" do
        run_test!
      end
    end
  end
end
