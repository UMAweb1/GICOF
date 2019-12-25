require 'rails_helper'

RSpec.describe Event, type: :model do
let(:user){ create(:user) }
let(:params){{title: 'タイトル', description: '内容', start: '2019-12-24 13:35', user_id: user.id}}
  context "正しくデータが保存される場合" do
  	before do
  		@event = Event.new(params)
  		@event.end = '2019-12-24 14:35'
  		@event.save
  	end
  	it "必要事項記載済みのため保存される" do
  		expect(@event).to be_valid
  	end
  end

  context "start == end" do
  	before do
  		@event = Event.new(params)
  		@event.end = '2019-12-24 13:35'
  		@event.save
  	end
  	it "同時刻の入力のため保存不可" do
  		expect(@event).to be_invalid
  		expect(@event.errors[:end]).to include("を開始時刻以降にしてください")
  	end
  end

  context "start > end" do
  	before do
  		@event = Event.new(params)
  		@event.end = '2019-11-23 13:35'
  		@event.save
  	end
  	it "開始時刻が終了時刻より後の入力のため保存不可" do
  		expect(@event).to be_invalid
  		expect(@event.errors[:end]).to include("を開始時刻以降にしてください")
  	end
  end

end
