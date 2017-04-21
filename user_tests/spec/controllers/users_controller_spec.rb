require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'renders the users index page'
  end

  describe 'GET #show' do
    context "valid user id" do
      it 'renders a specific user page'
    end

    context "invalid user id" do
      it 'redirects to the users index page'
    end
  end

  describe 'GET #new' do
    it 'should render a user create form'
  end

  describe 'DELETE #destroy' do
    it 'should delete a user from the database'
  end

  describe 'POST #create' do
    it 'should create a new user'
    it 'should redirect to a specific user show page'
  end

end
