# frozen_string_literal: true

require "swagger_helper"

describe "Categories API", type: :request  do

  # ADMIN ENDPOINTS

  path "/admin/categories" do
    get "Show all categories" do
      tags "Categories"
      produces "application/json"
  
      response "200", "Show all categories" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
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
  
  path "/admin/categories/{id}" do
    get "Show a category" do
      tags "Categories"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
  
      response "201", "Activity updated" do
        schema type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string }
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


  path "/admin/categories" do
    post "Create a category" do
      tags "Categories"

      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: [ "name", "description" ]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
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
      
      response "422", "Activity doesn't exist" do
        run_test!
      end
    end
  end

  path "/admin/categories/{id}" do
    put "Update a category" do
      tags "Categories"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: [ "name", "description" ]
      }

      response "201", "Category updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
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

  path "/admin/categories/{id}" do
    delete "Delete an category" do
      tags "Categories"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "Category deleted" do
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
  path "/api/v1/categories", swagger_doc: 'v1/api_v1.json' do
    get "Show all categories" do
      tags "Categories"
      produces "application/json"
  
      response "200", "Show all categories" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
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
end
