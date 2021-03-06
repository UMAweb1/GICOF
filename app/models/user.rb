class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # マッチング機能
  # following_id => フォローされているユーザーid、 follower_id => フォローしているユーザーid
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :following_relationships, source: :following
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Relationship', dependent: :destroy
  has_many :followed, through: :follower_relationships, source: :follower
  # 投稿機能
  has_many :posts, dependent: :destroy
  # 問い合わせ機能
  has_many :inquiries, dependent: :destroy
  # 通報機能
  has_many :reports, dependent: :destroy
  # DM機能(エントリー)
  has_many :entries, dependent: :destroy
  # DM機能(メッセージ)
  has_many :messages, dependent: :destroy
  # 好きなゲーム種類
  has_many :likes, dependent: :destroy
  has_many :gamegenres, through: :likes
  # カレンダー機能
  has_many :events, dependent: :destroy

  mount_uploader :image_profile_id, ImageUploader

  enum active_content: { 全力: true, 楽しむ: false }
  enum prefecture: {
        北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
        茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
        新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
        岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
        滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
        鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
        徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
        福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47
  }

  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name_kana, presence: true, length: { maximum: 10 }
  validates :last_name_kana, presence: true, length: { maximum: 10 }
  validates :nickname, presence: true, length: { maximum: 6 }, uniqueness: true
  validates :birthday, presence: true

  def follow(other_user)
    unless self == other_user
      following_relationships.find_or_create_by(following_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = following_relationships.find_by(following_id: other_user.id)
    relationship.destroy if relationship
  end

  # :自分がフォローしている人のデータを取得(other_user : 自分がフォローしたユーザー):
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # :自分をフォローした人のデータを取得(other_user : 自分をフォローしたユーザー):
  def followed?(other_user)
    follower_relationships.find_by(follower_id: other_user.id)
  end
end
