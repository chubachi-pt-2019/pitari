require 'rails_helper'

describe 'User管理機能', type: :system do
  describe 'User参加' do
    before do
      Capybara.app_host = "http://#{DEFAULT_HOST}:#{DEFAULT_PORT}"
      @discuss_1 = FactoryBot.create(:discuss, name: 'discuss_1')
      @user_1 = FactoryBot.create(:user, name: 'ユーザーA', discuss: @discuss_1)
      agenda = FactoryBot.create(:agenda, name: 'agenda_1', opinion: 1, user: @user_1)
      visit new_user_path + '?discuss_id=' + @discuss_1.id.to_s
    end

    context '参加ページが表示される' do
        it 'ページが表示される' do
            expect(page).to have_content @discuss_1.name
            expect(page).to have_button 'join'
        end
    end

    context '参加できる' do
        before do
            fill_in 'user_name', with: 'ユーザーB'
            click_button 'join'
        end
        
        it 'discussページが表示される' do
            expect(page).to have_content @discuss_1.agendas.last.name
            expect(page).to have_content @user_1.name
        end
    end

    context '参加できない' do
        before do
            click_button 'join'
        end
        
        it '参加ページが再表示' do
            expect(page).to have_button 'join'
            expect(page).to have_css '.alert-danger'
        end
    end
   end
end
