require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #home" do
    before  {get :home}

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it  "renders the home template" do
      expect(response).to render_template("home")
    end

    it "responds to html by default" do
      expect(response.content_type).to eq "text/html"
    end
  end

  describe  "GET #about"  do
    before  { get :about}

    it  "returns http success"  do
      expect(response).to have_http_status(:success)
    end

    it "renders the about template" do
      expect(response).to render_template("about")
    end

    it "responds to html by default" do
      expect(response.content_type).to eq "text/html"
    end
  end

  describe "GET #help" do
    before  {get :help}

    it  "return http success" do
      expect(response).to have_http_status(:success)
    end

    it  "return the help template" do
      expect(response).to render_template(:help)
    end

    it "responds to html by default" do
      expect(response.content_type).to eq "text/html"
    end
  end

  describe  "GET #contact" do
    before  {get :contact}

    it  "return http success" do
      expect(response).to have_http_status(:success)
    end

    it  "return the template contact" do
      expect(response).to render_template(:contact)
    end

    it "responds to html by default" do
      expect(response.content_type).to eq "text/html"
    end
  end
end
