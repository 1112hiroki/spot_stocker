require 'rails_helper'

describe 'Spot投稿機能', type: :system, js: true do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', sex: 0, age: 1)}
  let(:spot_a) { FactoryBot.create(:spot, title: 'テストタイトル', spot_name: 'スポットテスト場', review: 1, stay_time: 2, postcode: 1000000, prefecture_code: 13, address_city: '千代田区', address_street: '千代田', address_building: '', content: 'aa', user: user_a)}

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button "ログイン"
    visit new_spot_path
    fill_in '記事タイトル', with: spot.title
    fill_in 'スポット名称', with: spot.spot_name
    choose 'spot_stay_time_１時間以内'
    fill_in 'spot_postcode', with: spot.postcode
    select '東京都', from: 'spot[prefecture_name]'
    fill_in_rich_text_area 'spot_content', with: "content"
    click_button "投稿する"
  end

  describe '投稿機能' do
    context '投稿記事の『新規作成』' do
      let(:login_user) {user_a}
      let(:spot) {spot_a}
      it '投稿ができたか確認' do
        expect(page).to have_content 'テストタイトル'
      end
    end

    context '投稿記事の『編集』' do
      let(:login_user) {user_a}
      let(:spot) {spot_a}
      before do
        visit edit_spot_path(user_a)
        fill_in '記事タイトル', with: '編集後テストタイトル'
        click_button "更新する"
      end
      it '編集ができたか確認' do
        expect(page).to have_content '編集後テストタイトル'
      end
    end

    context '投稿記事の『削除』' do
      let(:login_user) {user_a}
      let(:spot) {spot_a}
      before do
        visit spot_path(spot_a)
        click_link "削除"
        page.driver.browser.switch_to.alert.accept
      end
      it '削除ができたか確認' do
        expect(page).to have_content '投稿を削除しました'
      end
    end

  end
end