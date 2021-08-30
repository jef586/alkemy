# frozen_string_literal: true

require "swagger_helper"

describe "Organizations API", type: :request  do

  # ADMIN ENDPOINTS

  path "/admin/organization" do
    put "Update organization info" do
      tags "Organization"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          phone: { type: :string },
          address: { type: :string },
          email: { type: :string },
          facebook_url: { type: :string },
          linkedin_url: { type: :string },
          instagram_url: { type: :string }
        },
        required: [ "name" ]
      }

      response "201", "Organization updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            phone: { type: :string },
            address: { type: :string },
            email: { type: :string },
            facebook_url: { type: :string },
            linkedin_url: { type: :string },
            instagram_url: { type: :string }
          },
          required: ['name', 'description' ]
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
  path "/api/v1/organization", swagger_doc: 'v1/api_v1.json' do
    get "Show organization info" do
      tags "Organization"
      produces "application/json"
  
      response "200", "Show organization info" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            phone: { type: :string },
            address: { type: :string },
            email: { type: :string },
            facebook_url: { type: :string },
            linkedin_url: { type: :string },
            instagram_url: { type: :string }
          },
          required: ['name' ]
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
