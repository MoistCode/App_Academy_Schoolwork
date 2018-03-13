require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET#new' do
    it 'renders a new page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST#create' do
    context 'Invalid parameters' do
      it 'Renders the new page again' do
        post :create, params: { user: {username: 'moistie', password: 'xxxxx'}}
        expect(response).to render_template(:new)
      end
    end

    context 'Valid parameters' do
      it 'Redirects to comments index' do
        post :create, params: { user: {username: 'moistie', password: 'xxxxxx'}}
        expect(response).to redirect_to(comments_path)
      end
    end
  end

end
