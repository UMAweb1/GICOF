require 'rails_helper'

RSpec.describe Publics::UsersController, type: :controller do
	let(:user){ create(:user) }

	context "ログイン時ユーザーページが表示される" do
		describe 'GET #show' do
			before do
				sign_in user
			end
			it "renders the :show template" do
				expect(controller.user_signed_in?).to be true
				get :show, params: {id: user.id}
				expect(response).to be_successful
			end
		end
	end
end
