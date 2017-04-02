require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "Put/Patch #update" do
    it "returns http success" do
      put :update
      expect(response).to have_http_status(:success)
    end
  end

end
