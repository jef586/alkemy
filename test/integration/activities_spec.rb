# frozen_string_literal: true

require "swagger_helper"

describe "Activities API", type: :request  do
  # ADMIN ENDPOINTS
  path "/admin/activities" do
    post "Create an activity" do
      tags "Activities"
      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string }
        },
        required: [ "name", "content" ]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string }
          },
          required: ["name", "content" ]
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

  path "/admin/activities/{id}" do
    put "Update an activity" do
      tags "Activities"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string }
        },
        required: [ "name", "content" ]
      }

      response "201", "Activity updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string }
          },
          required: ["name", "content" ]
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
