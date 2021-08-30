# frozen_string_literal: true

require "swagger_helper"

describe "Testimonials API", type: :request  do

  # ADMIN ENDPOINTS

  path "/admin/testimonials" do
    post "Create a testimonial" do
      tags "Testimonials"

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
          required: ['name', 'content' ]
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

  path "/admin/testimonials/{id}" do
    put "Update a testimonial" do
      tags "Testimonials"
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

      response "201", "Testimonial updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string }
          },
          required: ['name', 'content' ]
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

  path "/admin/testimonials/{id}" do
    delete "Delete an testimonial" do
      tags "Testimonials"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "Testimonial deleted" do
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
  path "/api/v1/testimonials", swagger_doc: 'v1/api_v1.json' do
    get "Show all testimonials" do
      tags "Testimonials"
      produces "application/json"
  
      response "200", "Show all testimonials" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string }
          },
          required: ['name', 'content' ]
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
