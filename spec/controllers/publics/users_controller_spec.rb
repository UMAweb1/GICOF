require 'rails_helper'

RSpec.describe Publics::UsersController, type: :controller do
  let(:user) { create(:user) }

  context 'ログイン時のユーザーテスト' do
    describe '各アクション' do
      before do
        sign_in user
   	    @user = user
   	  end
      it 'renders action template' do
        expect(controller.user_signed_in?).to be true
        get :show, params: { id: user.id }
        get :matching, params: { id: user.id }
        get :info, params: { user_id: @user.id, id: user.id }, format: :js
        get :edit, params: { id: user.id }, format: :js
        get :edit2, params: { id: user.id }, format: :js
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  context '未ログイン時ログインページに遷移される' do
    describe 'index' do
      it '302 response' do
        get :index
        expect(response.status).to eq(302)
      end
      it 'redirects to the sign-in page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
    describe 'show' do
      before do
        @user = user
   	  end
      it '302 response' do
        get :show, params: { id: @user.id }
   	    expect(response).to_not be_successful
   	    expect(response.status).to eq(302)
   	  end
      it 'redirects to the sign-in page' do
   	    get :show, params: { id: @user.id }
   	    expect(response).to redirect_to '/users/sign_in'
   	  end
    end
  end
end
