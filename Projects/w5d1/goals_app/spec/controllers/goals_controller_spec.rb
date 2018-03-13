require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  User.destroy_all
  let(:user) { User.create!(username: 'Moistie', password: '123456') }

  before(:each) do
    allow(controller).to receive(:current_user) { user }
  end

  describe 'GET#index' do
    it 'renders index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#show' do
    it 'renders show page' do
      get :show
      expect(response).to render_template(:show)
    end
  end

  describe 'GET#new' do
    it 'renders new page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET#edit' do
    it 'renders edit page' do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST#create' do
    context 'empty goal' do
      it 'renders new' do
        post :create, params: { goal: {goal: ''}}
        expect(response).to render_template(:new)
      end
    end

    context 'valid goal' do
      it 'Redirects to newly created goal' do
        post :create, params: { goal: {goal: 'Become more moist'}}
        expect(response).to redirect_to(goal_path)
      end
    end
  end

  describe 'PATCH#update' do
    let(:goal) { Goal.create(goal: 'Become less moist') }
    context 'empty goal' do
      it 'renders template' do
        # allow(controller).to receive(@goal) { Goal.find_by(goal: 'Become less moist')}
        patch :update, params: { goal: { goal: '' }}
        expect(response).to render_template(:edit)
      end
    end

    context 'valid changes' do
      it 'redirects to updated goal' do
        post :update, params: { goal: { goal: 'Smash head wdiy7t6' }}
        expect(response).to redirect_to(goal_path)
      end
    end
  end

  describe 'DELETE#destroy' do
    it 'Returns to goals index page' do
      delete :destroy
      expect(response).to redirect_to(goals_path)
    end
  end
end
