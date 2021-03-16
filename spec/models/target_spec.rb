require 'rails_helper'

RSpec.describe Target, type: :model do
  before do
    @target = FactoryBot.build(:target)
  end

  describe '目標設定' do
    context '目標が投稿できる時' do
      it '全項目を入力すれば投稿できる' do
        expect(@target).to be_valid
      end
      it '目標の人物が未入力でも投稿できる' do
        @target.great_man = ''
        @target.great_man = ''
        expect(@target).to be_valid
      end
      it 'イメージ写真がなくても投稿できる' do
        @target.image = nil
        @target.image = nil
        expect(@target).to be_valid
      end
    end
    context '目標が投稿できない時' do
      it 'titleが未入力だと投稿できない' do
        @target.title = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Title can't be blank")
      end
      it 'genreが未選択だと投稿できない' do
        @target.genre_id = 1
        @target.valid?
        expect(@target.errors.full_messages).to include("Genre must be other than 1")
      end
      it 'deadlineが未入力だと投稿できない' do
        @target.deadline = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Deadline can't be blank")
      end
      it 'deadlineが過去の日付けだと投稿できない' do
        @target.deadline = '2021-3-1'
        @target.valid?
        expect(@target.errors.full_messages).to include("Deadline can`t specify a date in the past")
      end
      it 'planが未入力だと投稿できない' do
        @target.plan = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Plan can't be blank")
      end
      it 'futureが未入力だと投稿できない' do
        @target.future = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Future can't be blank")
      end
    end
  end
end
