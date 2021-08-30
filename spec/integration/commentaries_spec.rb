# frozen_string_literal: true

require "swagger_helper"

describe "Commentaries API", type: :request  do
  # ADMIN ENDPOINTS
  path "/admin/commentaries" do
    get "Show all commentaries" do
      tags "Commentaries"
      produces "application/json"
  
      response "200", "Show all commentaries" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            body: { type: :string }
          },
          required: ['body']
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

    path "/api/v1/posts/commentaries", swagger_doc: 'v1/api_v1.json' do
      get "Show all commentaries" do
        tags "Commentaries"
        produces "application/json"
    
        response "200", "Show all commentaries" do
          schema type: :object,
            properties: {
              id: { type: :integer },
              body: { type: :string }
            },
            required: ['body' ]
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
    
    path "/api/v1/commentaries/{id}", swagger_doc: 'v1/api_v1.json' do
      get "Show a commentary" do
        tags "Commentaries"
        produces "application/json"
        parameter name: :id, in: :path, type: :string
    
        response "201", "Activity updated" do
          schema type: :object,
            properties: {
              body: { type: :string }
            },
            required: ['body' ]
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
