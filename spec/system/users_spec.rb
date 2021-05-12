require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
    Capybara.default_max_wait_time = 5
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{ User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # ログアウトアイコンをクリックするとログアウトし、ログインページに遷移することを確認する
      find("img[src='/assets/exit-d1173c0d39fadb8c3593b98de49b3a853f93d70a81074c0de072af6a09d7c0c9.png']").click
      page.driver.browser.switch_to.alert.accept
      expect(current_path).to eq(new_user_session_path)
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user_nickname', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{find('input[name="commit"]').click}.to change{ User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq("/users")
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
    Capybara.default_max_wait_time = 5
  end
  context 'ログインできるとき' do 
    it '正しい情報を入力すればログインができてトップページに移動する' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではログインができずにログインページへ戻ってくる' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
