FactoryBot.define do
  factory :event do
    association :user
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:description) { |n| "内容#{n}" }
    self.start {'2019-12-24 13:35'}
    self.end {'2019-12-24 14:35'}
  end
end
