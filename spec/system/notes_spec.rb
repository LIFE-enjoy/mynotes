require 'rails_helper'

RSpec.describe 'メモ新規作成', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @note_title = Faker::Lorem.word
    @note_text = Faker::Lorem.sentence
    Capybara.default_max_wait_time = 5
  end
  context 'メモ新規作成ができるとき'do
    it 'ログインしたユーザーはメモを新規作成できる' do
      # ログインする
      sign_in(@user)
      # 新規メモ作成のアイコンをクリックするとNoteモデルのカウントが1上がること確認する
      expect{
        find("img[src='/assets/new-2b0d8f55345639d245a2fcd6fd8309508dda18f3d056c0b8023a6728cb24143d.png']").click
      }.to change { Note.count }.by(1)
      # フォームに情報を入力する
      fill_in 'memo-title', with: @note_title
      fill_in_rich_text_area 'memo-content', with: @note_text
    end
  end
  context 'メモ新規作成ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # 新規メモ作成ページに遷移する
      visit new_note_path
      # ログインページに戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end