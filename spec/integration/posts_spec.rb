# frozen_string_literal: true

require "swagger_helper"

describe "Posts API", type: :request  do
  # ADMIN ENDPOINTS

  path "/admin/posts/{id}" do
    get "Show a post" do
      tags "Posts"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "201", "Activity updated" do
        schema type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string },
          category_id: { type: :integer }
        },
        required: ["name", "content", "category_id" ]
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


  path "/admin/posts" do
    post "Create a post" do
      tags "Posts"

      consumes "application/json"
      produces "application/json"

      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string },
          category_id: { type: :integer }
        },
        required: ["name", "content", "category_id" ]
      }

      response "201", "Activity created" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string },
            category_id: { type: :integer }
          },
          required: ["name", "content", "category_id" ]
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

  path "/admin/posts/{id}" do
    put "Update a post" do
      tags "Posts"
      produces "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string },
          category_id: { type: :integer }
        },
        required: ["name", "content", "category_id" ]
      }

      response "201", "Post updated" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
          },
          required: ["name", "description" ]
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

  path "/admin/posts/{id}" do
    delete "Delete an post" do
      tags "Posts"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "204", "Post deleted" do
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
  path "/api/v1/posts", swagger_doc: "v1/api_v1.json" do
    get "Show all posts" do
      tags "Posts"
      produces "application/json"

      response "200", "Show all posts" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            content: { type: :string },
            category_id: { type: :integer }
          },
          required: ["name", "content", "category_id" ]
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

  path "/api/v1/posts/{id}", swagger_doc: "v1/api_v1.json" do
    get "Show a post" do
      tags "Posts"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "201", "Activity updated" do
        schema type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string },
          category_id: { type: :integer }
        },
        required: ["name", "content", "category_id" ]
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
