require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe  "GET #new"  do
    before  {get :new}
     it "returns http success" do
      expect(response).to have_http_status(:success)
      # expect(response.status).to eq(200)  the same above
    end

    it  "renders the home template" do
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before  {post :create, user: attributes_for(:user)}
      it 'creates a new user' do
        expect(User.count).to eq(1)
      end

      it 'redirects to the "root_path" and set flash' do
        expect(response).to redirect_to root_path
        expect(flash[:info]).to match(/Please check your email to activate your account./)
      end
    end

    context 'with invalid attributes' do
      before  {post :create, user: attributes_for(:invalid_user)}
      it 'creates a new user' do
        expect(User.count).to eq(0)
      end

      it 'render to new' do
        expect(response).to render_template :new
      end
    end
  end
end
