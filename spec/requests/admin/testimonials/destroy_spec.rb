# frozen_string_literal: true

require "rails_helper"

describe "DELETE /admin/testimonials/:id", type: :request do
  let!(:user) { create(:user) }
  let!(:testimonials) { create_list(:testimonial, 10) }
  let!(:testimonial_id) { testimonials.first.id }

  context "when testimonial is destroyed" do
    before { delete "/admin/testimonials/#{testimonial_id}", headers: { "Authorization": sign_in(user) } }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end

  context "when user is a regular" do
  let(:regular) { create(:user, role: nil) }

  before { delete "/admin/testimonials/#{testimonial_id}", headers: { "Authorization": sign_in(regular) } }


  it "returns an HTTP status 403" do
    expect(response).to have_http_status(403)
  end
  it "returns error message: 'Ups.. you shouldn't be here'" do
    expect(body_json["not_authorized"]).to eq("Ups.. you shouldn't be here")
  end
end
end
