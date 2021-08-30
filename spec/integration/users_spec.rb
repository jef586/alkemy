# frozen_string_literal: true

require "swagger_helper"

describe "Users API", type: :request  do
  # ADMIN ENDPOINTS

  path "/admin/users" do
    get "Show all users" do
      tags "Users"
      produces "application/json"

      response "200", "Show all users" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            role: { type: :string },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string }
          },
          required: ["role", "first_name", "last_name", "email"]
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


  # API V1 ENDPOINTS

  path "/api/v1/users/{id}", swagger_doc: "v1/api_v1.json" do
    put "Update a user" do
      tags "Users"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          role: { type: :string },
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string }
        },
        required: ["role", "first_name", "last_name", "email"]
      }

      response "201", "User updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            role: { type: :string },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string }
          },
          required: ["role", "first_name", "last_name", "email"]
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

  path "/api/v1/users/{id}", swagger_doc: "v1/api_v1.json" do
    delete "Delete an user" do
      tags "Users"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "User deleted" do
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
end
