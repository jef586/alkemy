# frozen_string_literal: true

require "swagger_helper"

describe "Slides API", type: :request  do

  # ADMIN ENDPOINTS

  path "/admin/slides" do
    get "Show all slides" do
      tags "Slides"
      produces "application/json"
  
      response "200", "Show all slides" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
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
  
  path "/admin/slides/{id}" do
    get "Show a slide" do
      tags "Slides"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
  
      response "201", "Activity updated" do
        schema type: :object,
          properties: {
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
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


  path "/admin/slides" do
    post "Create a slide" do
      tags "Slides"

      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          text: { type: :string },
          order: { type: :integer },
          image_url: { type: :string }
        },
        required: ['text', 'image_url' ]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
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

  path "/admin/slides/{id}" do
    put "Update a slide" do
      tags "Slides"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
      }

      response "201", "Slide updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
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

  path "/admin/slides/{id}" do
    delete "Delete an slide" do
      tags "Slides"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "Slide deleted" do
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
  path "/api/v1/slides", swagger_doc: 'v1/api_v1.json' do
    get "Show all slides" do
      tags "Slides"
      produces "application/json"
  
      response "200", "Show all slides" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            order: { type: :integer },
            image_url: { type: :string }
          },
          required: ['text', 'image_url' ]
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
