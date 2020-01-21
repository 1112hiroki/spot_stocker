require 'rails_helper'

describe 'ユーザーログイン' do

  describe 'ログインする' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: "test@example.com"
      fill_in 'パスワード', with: "password"
      click_button "ログイン"
    end

    it 'ログイン後、投稿一覧へ遷移する' do
      expect(page).to have_content 'スポット一覧'
    end
  end

  describe '新規登録する' do
    before do
      visit new_user_registration_path
      fill_in 'ユーザー名', with: "さとう"
      fill_in 'メールアドレス', with: "sato@example.com"
      choose 'user_sex_男性'
      choose 'user_age_１０代'
      fill_in 'パスワード', with: "password"
      fill_in 'パスワード再入力', with: "password"
      click_button "アカウントを作成"
    end

    it '登録後、投稿一覧へ遷移する' do
      expect(page).to have_content 'スポット一覧'
    end
  end
end