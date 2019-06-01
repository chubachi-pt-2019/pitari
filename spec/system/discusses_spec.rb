require 'rails_helper'

describe 'Discuss管理機能', type: :system do
  describe 'Discuss作成' do
    before do
      Capybara.app_host = "http://#{DEFAULT_HOST}:#{DEFAULT_PORT}"
    end

    context 'Positiveな会議を作成できる' do
      before do
        visit root_path
        fill_in 'Please input the meeting name...', with: '会議A'
        fill_in 'Please input your name...', with: 'ユーザーA'
        fill_in 'Please input the first agenda...', with: 'テーマ1'
        choose  'Positive'
        click_button 'Start'
      end

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content 'ユーザーA'
        expect(page).to have_content 'テーマ1'
      end
    end

    context 'Negativeな会議を作成できる' do
      before do
        visit root_path
        fill_in 'Please input the meeting name...', with: '会議A'
        fill_in 'Please input your name...', with: 'ユーザーA'
        fill_in 'Please input the first agenda...', with: 'テーマ1'
        choose  'Negative'
        click_button 'Start'
      end

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content 'ユーザーA'
        expect(page).to have_content 'テーマ1'
      end
    end

    context 'Meeting Name不足の会議' do
      before do
        visit root_path
        fill_in 'Please input your name...', with: 'ユーザーA'
        fill_in 'Please input the first agenda...', with: 'テーマ1'
        choose  'Negative'
        click_button 'Start'
      end

      it '会議を作成できない' do
        expect(page).to have_css '.alert-danger'
      end
    end

    context 'User Name不足の会議' do
      before do
        visit root_path
        fill_in 'Please input the meeting name...', with: '会議A'
        fill_in 'Please input the first agenda...', with: 'テーマ1'
        choose  'Negative'
        click_button 'Start'
      end

      it '会議を作成できない' do
        expect(page).to have_css '.alert-danger'
      end
    end

    context 'Agenda不足の会議' do
      before do
        visit root_path
        fill_in 'Please input the meeting name...', with: '会議A'
        fill_in 'Please input your name...', with: 'ユーザーA'
        choose  'Negative'
        click_button 'Start'
      end

      it '会議を作成できない' do
        expect(page).to have_css '.alert-danger'
      end
    end

    context 'Opinion不足の会議' do
      before do
        visit root_path
        fill_in 'Please input the meeting name...', with: '会議A'
        fill_in 'Please input your name...', with: 'ユーザーA'
        fill_in 'Please input the first agenda...', with: 'テーマ1'
        click_button 'Start'
      end

      it '会議を作成できない' do
        expect(page).to have_css '.alert-danger'
      end
    end
  end
end
