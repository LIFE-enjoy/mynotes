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

RSpec.describe 'メモ編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @note = FactoryBot.create(:note)
    @note_title = Faker::Lorem.word
    @note_text = Faker::Lorem.sentence
    Capybara.default_max_wait_time = 5
  end
  context 'メモが編集できるとき'do
    it 'ログインしたユーザーはメモを編集できる' do
      # ログインする
      sign_in(@user)
      # 新規メモ作成する
      find("img[src='/assets/new-2b0d8f55345639d245a2fcd6fd8309508dda18f3d056c0b8023a6728cb24143d.png']").click
      # フォームに情報を入力する
      fill_in 'memo-title', with: @note_title
      fill_in_rich_text_area 'memo-content', with: @note_text
      # メモ編集ページへ遷移する
      click_on('新規メモ')
      # タイトルフォームを編集する
      fill_in 'memo-title', with: ""
      fill_in 'memo-title', with: 'タイトル編集済み'
      fill_in_rich_text_area 'memo-content', with: ""
      fill_in_rich_text_area 'memo-content', with: '内容編集済み'
      # ページをリロードする
      visit current_path
      # フォーム内容が変わっていることを確認する
      expect(page).to have_text('タイトル編集済み')
      expect(page).to have_text('内容編集済み')
    end

    it 'ログインしたユーザーはチャットページでもメモを編集できる' do
      # ログインする
      sign_in(@user)
      # 新規メモ作成する
      find("img[src='/assets/new-2b0d8f55345639d245a2fcd6fd8309508dda18f3d056c0b8023a6728cb24143d.png']").click
      # フォームに情報を入力する
      fill_in 'memo-title', with: @note_title
      fill_in_rich_text_area 'memo-content', with: @note_text
      # チャットページへ遷移する
      find("img[src='/assets/chat-a7dfe77d57b48bee8fe2ec8b5031d7e589b3242786fce325ad2e2f64f4d99815.png']").click
      # フォームを編集する
      fill_in_rich_text_area 'memo-content', with: ""
      fill_in_rich_text_area 'memo-content', with: '内容編集済み'
      # ページをリロードする
      visit current_path
      # フォーム内容が変わっていることを確認する
      expect(page).to have_text('内容編集済み')
    end
  end

  context 'メモが編集できないとき'do
    it 'ログインしていないと編集ページに遷移できない' do
      # 作成したメモの編集ページに遷移する
      visit edit_note_path(@note.id)
      # ログインページに戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end

    it 'ログインしても他の人の編集ページに遷移できない' do
      # ログインする
      sign_in(@user)
      # 他の人の編集ページに遷移する
      visit edit_note_path(@note.id)
      # トップページに戻されることを確認する
      expect(current_path).to eq(root_path)
    end

    it 'ログインしても他の人の編集ページに遷移できない' do
      # ログインする
      sign_in(@user)
      # 他の人の編集ページに遷移する
      visit edit_note_path(@note.id)
      # トップページに戻されることを確認する
      expect(current_path).to eq(root_path)
    end

    it 'ログインしても他の人のチャットページではメモを編集できない' do
      # ログインする
      sign_in(@user)
      # 他の人のチャットページに遷移する
      visit note_comments_path(@note.id)
      # フォームに記入する
      fill_in_rich_text_area 'memo-content', with: ""
      fill_in_rich_text_area 'memo-content', with: '内容編集済み'
      # ページをリロードする
      visit current_path
      # フォーム内容が変わっていないことを確認する
      expect(page).to have_no_text('内容編集済み')
    end
  end
end