require 'rails_helper'

RSpec.describe 'Spot投稿機能' do
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
    # fill_in 'spot_content', with: spot.content
    fill_in_rich_text_area 'spot_content', with: spot.content
    click_button "投稿する"
  end

  describe 'Spot投稿機能' do
    context 'ユーザーAがログイン後、新規記事作成' do
      let(:login_user) {user_a}
      let(:spot) {spot_a}
      # 新規投稿をするテストを書く
      it '投稿ができたか確認' do
        expect(page).to have_content 'テストタイトル'
      end
    end
  end
end