require 'rails_helper'

describe 'ログイン機能' do

  describe 'ログインする' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: "test@example.com"
      fill_in 'パスワード', with: "password"
      click_button "ログイン"
    end

    it '投稿一覧へ遷移する' do
      expect(page).to have_content 'スポット一覧'
    end
  end
end
