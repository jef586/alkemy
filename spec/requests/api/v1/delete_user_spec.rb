# frozen_string_literal: true

require "rails_helper"


RSpec.describe "API/VI DELETE USER", type: :request do
        let!(:user) { create(:user) }
        let!(:users) { create_list(:user, 10) }
        let!(:user_id) { users.first.id }


        describe "DELETE /users/:id" do
          before { delete "/api/v1/users/#{user_id}", headers: { "Authorization": sign_in(user) } }

          it "returns status code 204" do
            expect(response).to have_http_status(204)
          end
        end

        describe "NOT DELETE when user is not itself" do
                let(:impostor_user) { create(:user, role_id: !1) }

                before { delete "/api/v1/users/#{user_id}", headers: { "Authorization": sign_in(impostor_user) } }

                it "returns status code 403" do
                  expect(response).to have_http_status(403)
                end
                it "returns a you shouldnt be here message" do
                expect(response.body).to include("Ups.. you shouldn't be here")
              end
              end
      end
