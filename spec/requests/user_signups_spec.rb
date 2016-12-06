require 'rails_helper'

RSpec.describe "UserSignups", type: :request do
  describe "GET /user_signups" do
    before  {get sign_up_path}

    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end

    it "render template" do
      expect(response).to render_template('users/new')
    end
  end

  describe "post users_path" do
    before  {post users_path, params: { user: { name:  "",
                                                email: "user@invalid",
                                                password:              "foo",
                                                password_confirmation: "bar" }
                                      }
            }

     it "error params should render to new" do
      expect(response).to render_template('users/new')
      expect(response.body).to  include("The form contains 5 errors.")
    end
  end
end
