require 'rails_helper'

RSpec.describe "投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @target = FactoryBot.create(:target)
  end
  context '投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのリンクがある
      expect(page).to have_content('投稿する')
      # 新規投稿ページに遷移する
      visit new_target_path
      # フォームに情報を入力する
      fill_in 'target-name', with: @target.title
      fill_in 'target_deadline', with: @target.deadline
      fill_in 'target-info', with: @target.plan
      fill_in 'target-after', with: @target.future
      # 送信するとTargetモデルのカウントが１上がる
      expect{find('input[name="commit"]').click}.to change { Target.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページに投稿したタイトルが存在する
      expect(page).to have_content(@target.title)
      # トップページに投稿した期日が存在する
      expect(page).to have_content(@target.deadline.strftime("%Y年%m月%d日"))
      # 投稿者の名前が存在する
      expect(page).to have_content(@target.user.name)
    end
  end
  context '投稿できないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end
