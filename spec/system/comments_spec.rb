require 'rails_helper'

RSpec.describe "コメント", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @note = FactoryBot.create(:note)
    Capybara.default_max_wait_time = 5
  end

  context 'コメントできる時'do
    it 'ログインしたユーザーは自分のメモにコメントできる' do
      # ログインする
      sign_in(@user)
      # 新規メモ作成する
      find("img[src='/assets/new-2b0d8f55345639d245a2fcd6fd8309508dda18f3d056c0b8023a6728cb24143d.png']").click
      # フォームに情報を入力する
      fill_in 'memo-title', with: @note_title
      fill_in_rich_text_area 'memo-content', with: @note_text
      # チャットページに遷移する
      find("img[src='/assets/chat-a7dfe77d57b48bee8fe2ec8b5031d7e589b3242786fce325ad2e2f64f4d99815.png']").click
      # コメントする
      fill_in 'comment-text', with:'自分のコメント'
      click_on('送信')
      # 自分のコメントがチャット欄に追加されていることを確認する
      expect(page).to have_content('自分のコメント')
    end

    it 'ログインしたユーザーは他の人のメモにコメントできる' do
      # ログインする
      sign_in(@user)
      # 他の人のチャットページに遷移する
      visit note_comments_path(@note.id)
      # コメントする
      fill_in 'comment-text', with:'相手のコメント'
      click_on('送信')
      # 自分のコメントがチャット欄に追加されていることを確認する
      expect(page).to have_content('相手のコメント')
    end
  end

  context 'コメントできない時'do
    it 'ログインしないとチャット画面に遷移できない' do
      # 他の人のチャットページに遷移する
      visit note_comments_path(@note.id)
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
