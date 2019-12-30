# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gamegenre.create(
	 [
 		 { gamegenre: 'ｱｸｼｮﾝ' },
 		 { gamegenre: 'ﾊﾟｽﾞﾙ' },
 		 { gamegenre: 'RPG' },
 		 { gamegenre: 'ﾚｰｽ' },
 		 { gamegenre: '恋愛' },
 		 { gamegenre: '育成' },
 		 { gamegenre: 'ｵｰﾌﾟﾝﾜｰﾙﾄﾞ' },
 		 { gamegenre: 'ｼｭｰﾃｨﾝｸﾞ' },
 		 { gamegenre: 'FPS' }
 	]
)

Admin.create!(email: 'admin@example.com',
			 	         password: 'password',
			 	         password_confirmation: 'password')

User.create!(first_name: 'テスト',
				         last_name: '太郎',
				         first_name_kana: 'テスト',
				         last_name_kana: 'タロウ',
				         nickname: 'テスト',
				         active_time: '21時以降',
				         active_area: '難波',
				         prefecture: '大阪府',
				         active_content: '全力',
				         introduction: 'テストテストテストテスト',
				         birthday: '1995-07-29',
				         email: 'test@test.com',
				         password: 'testuser',
				         password_confirmation: 'testuser')
