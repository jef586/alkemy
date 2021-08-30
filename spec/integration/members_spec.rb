# frozen_string_literal: true

require "swagger_helper"

describe "Members API", type: :request  do
  # ADMIN ENDPOINTS

  path "/admin/members" do
    post "Create a member" do
      tags "Members"

      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          facebook_url: { type: :string },
          instagram_url: { type: :string },
          linkendin_url: { type: :string },
          description: { type: :string }
        },
        required: [ "name" ]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            facebook_url: { type: :string },
            instagram_url: { type: :string },
            linkendin_url: { type: :string },
            description: { type: :string }
          },
          required: ["name"]
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

  path "/admin/members/{id}" do
    put "Update a member" do
      tags "Members"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          facebook_url: { type: :string },
          instagram_url: { type: :string },
          linkendin_url: { type: :string },
          description: { type: :string }
        },
        required: [ "name"]
      }

      response "201", "Member updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            facebook_url: { type: :string },
            instagram_url: { type: :string },
            linkendin_url: { type: :string },
            description: { type: :string }
          },
          required: ["name"]
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

  path "/admin/members/{id}" do
    delete "Delete an member" do
      tags "Members"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "Member deleted" do
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
  path "/api/v1/members", swagger_doc: "v1/api_v1.json" do
    get "Show all members" do
      tags "Members"
      produces "application/json"

      response "200", "Show all members" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            facebook_url: { type: :string },
            instagram_url: { type: :string },
            linkendin_url: { type: :string },
            description: { type: :string }
          },
          required: ["name"]
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
