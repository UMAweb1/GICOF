require 'rails_helper'

RSpec.describe User, type: :model do
	context "データが正しく保存される" do
		before do
			@user = create(:user)
		end
		it "必要事項記載済みのため保存される" do
			expect(@user).to be_valid
		end
	end

	context "データが正しく保存されない" do
		before do
			@user = User.new
			@user.first_name = "名字"
			@user.last_name = "名前"
			@user.first_name_kana = "ミョウジ"
			@user.last_name_kana = "ナマエ"
			@user.nickname = "ニックネーム"
			@user.birthday = "1995-07-29"
			@user.email = ""
			@user.password = "userpass"
			@user.password_confirmation = "userpass"
			@user.save
		end
		it "emailが入力されていないので保存されない" do
			expect(@user).to be_invalid
			expect(@user.errors[:email]).to include("を入力してください")
		end
	end
end