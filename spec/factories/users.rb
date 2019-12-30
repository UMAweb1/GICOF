FactoryBot.define do
	 factory :user do
 		 sequence(:first_name) { |n| "名字#{n}" }
 		 sequence(:last_name) { |n| "名前#{n}" }
 		 sequence(:first_name_kana) { |n| "ミョウジ#{n}" }
 		 sequence(:last_name_kana) { |n| "ナマエ#{n}" }
 		 sequence(:nickname) { |n| "あだな#{n}" }
 		 sequence(:active_time) { |n| "#{n}時以降" }
 		 sequence(:active_area) { |n| "難波#{n}" }
 		 birthday { '1995-07-29' }
 		 sequence(:email) { |n| "email@email#{n}" }
 		 sequence(:password) { |n| "userpass#{n}" }
 		 sequence(:password_confirmation) { |n| "userpass#{n}" }
 	end
end
