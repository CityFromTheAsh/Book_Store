require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #MainAdmin" do
    it "returns http success" do
      get :MainAdmin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #admin" do
    it "returns http success" do
      get :admin
      expect(response).to have_http_status(:success)
    end
  end

end
