require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) { User.new(email: 'email', password: 'password') }

  describe 'GET #index' do
    it 'renders the users index page' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do

    context "valid user id" do
      it 'renders a specific user page' do
        user.save!
        get :show, params: { id: user.id }
        expect(response).to render_template("show")
      end
    end

    context "invalid user id" do
      it 'redirects to the users index page' do
        get :show, params: { id: -1 }
        expect(response).to redirect_to "#{users_url}"
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe 'GET #new' do
    it 'should render a user create form' do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a user from the database' do
      user.save!
      expect(User.all.length).to eq(1)

      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_url)
      expect(User.all.length).to eq(0)
    end
  end

  describe 'POST #create' do
    context "with valid params" do
      it 'should redirect user to users show page on success' do
        post :create, params: { user: {email: "something@gmail.com", password: "password"} }
        expect(response).to redirect_to(user_url(User.find_by(email: "something@gmail.com")))
      end

    end

    context "with invalid params" do
      it 'should redirect_to registration page' do
        post :create, params: { user: {email: "", password: ""} }
        expect(response).to redirect_to(new_user_url)
      end
    end
  end

end
