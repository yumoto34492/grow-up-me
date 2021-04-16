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

RSpec.describe '投稿編集', type: :system do
  before do
    @target1 = FactoryBot.create(:target)
    @target2 = FactoryBot.create(:target)
  end
  context '投稿を編集できるとき' do
    it 'ログインしたユーザーは投稿をした目標の編集ができる' do
      # 目標１を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @target1.user.email
      fill_in 'Password', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 詳細ページに遷移する
      visit target_path(@target1)
      # 目標１に「編集」ボタンがある
      expect(page).to have_content("編 集")
      # 編集ページに遷移する
      visit edit_target_path(@target1)
      # すでに投稿済みの内容がフォームに入っている
      expect(find('#target-name').value).to eq(@target1.title)
      expect(find('#target_deadline').value).to eq(@target1.deadline.strftime)
      expect(find('#target-info').value).to eq(@target1.plan)
      expect(find('#target-after').value).to eq(@target1.future)
      # 投稿内容を編集する
      fill_in'target-name', with: "#{@target1.title}+編集したタイトル"
      # fill_in'target_deadline', with: "#{@target1.deadline('2021-6-1')}"
      fill_in'target-info', with: "#{@target1.plan}+編集したアクションプラン"
      fill_in 'target-after', with: "#{@target1.future}+編集したその後の自分"
      # 編集してもTargetモデルのカウントはかわらない
      expect{find('input[name="commit"]').click}.to change {Target.count}.by(0)
      # トップページに遷移する
      visit root_path
      # トップページに先程変更した内容のツイートが存在する（タイトル）
      expect(page).to have_content("#{@target1.title}+編集したタイトル")
      # トップページに先程変更した内容のツイートが存在する（期日）
      # expect(page).to have_content("#{@target1.deadline.strftime("2021年6月1日")}")
    end
  end
  context '投稿を編集できないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
      # ツイート１を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @target1.user.email
      fill_in 'Password', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 詳細ページ遷移する
      visit target_path(@target2)
      # ツイート２に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # target1詳細ページ遷移する
      visit target_path(@target1)
      # ツイート1に「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
       # トップページにいる
       visit root_path
       # target2詳細ページ遷移する
       visit target_path(@target2)
       # ツイート2に「編集」ボタンがないことを確認する
       expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe '投稿削除', type: :system do
  before do
    @target1 = FactoryBot.create(:target)
    @target2 = FactoryBot.create(:target)
  end

  context '目標が削除できるとき' do
    it 'ログインしたユーザーは自ら投稿した目標を削除することができる' do
      # 目標１を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @target1.user.email
      fill_in 'Password', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 詳細ページへ遷移する
      visit target_path(@target1)
      # 削除ボタンを押す
      expect(page).to have_content('削除')
      find('[id="modalOpen"]').click
      # 投稿を削除するとレコードが１減る
      expect{find_link('削除する', href: target_path(@target1)).click}.to change {Target.count}.by(-1)
      # トップページに遷移する
      visit root_path
      # トップページに目標１の内容が存在しない
      expect(page).to have_no_content(@target1)
    end
  end
  context '目標が削除できない' do
    it 'ログインしたユーザーは自分以外が投稿した目標の削除ができない' do
      # 目標１を投稿したユーザーでログイン
      visit new_user_session_path
      fill_in 'Email', with: @target1.user.email
      fill_in 'Password', with: @target1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 目標２の詳細画面へ遷移
      visit target_path(@target2)
      # 目標２に削除ボタンがない
      expect(page).to have_no_content('削除')
    end
    it 'ログインしていないと目標の削除ボタンがない' do
      # トップページに移動する
      visit new_user_session_path
      fill_in 'Email', with: @target2.user.email
      fill_in 'Password', with: @target2.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 目標１に削除ボタンがない
      visit target_path(@target1)
      # 目標２に削除ボタンがない
      expect(page).to have_no_content('削除')
    end
  end
end