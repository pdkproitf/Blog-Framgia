require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe  "should get new"  do
    before  {get :new}
     it "returns http success" do
      expect(response).to have_http_status(:success)
      # expect(response.status).to eq(200)  the same above
    end

    it  "renders the home template" do
      expect(response).to render_template("new")
    end
  end
end
