require_relative 'pages/the_internet/dynamic_controls_page'

feature 'The "Dynamic Controls" page allows users to remove and add checkbox' do
  let(:dynamic_controls_page) { DynamicControlsPage.new }

  describe 'When i am a user in dynamic controls page' do
    before(:each) do
      dynamic_controls_page.load
      expect(page).to have_content 'Dynamic Controls'
    end

    it 'I click on a button and remove the checkbox' do
      dynamic_controls_page.click_on_checkbox_add_or_remove('Remove')
      expect(dynamic_controls_page.checkbox_form).to have_no_content('A checkbox')
      expect(dynamic_controls_page.has_checkbox?).to be false
    end

    it 'i first remove a checkbox, and then Add it again through a button' do
      dynamic_controls_page.click_on_checkbox_add_or_remove('Remove')
      expect(dynamic_controls_page.checkbox_form).to have_no_content('A checkbox')

      dynamic_controls_page.click_on_checkbox_add_or_remove('Add')
      expect(dynamic_controls_page.checkbox_form).to have_content('A checkbox')
      expect(dynamic_controls_page.has_checkbox?).to be true
    end

    it 'Remove a checkbox, and then Add it again and then remove it a second time' do
      skip 'This is skipped because we have a bug when the user click to remove twice'
      dynamic_controls_page.click_on_checkbox_add_or_remove('Remove')
      expect(dynamic_controls_page.checkbox_form).to have_no_content('A checkbox')

      dynamic_controls_page.click_on_checkbox_add_or_remove('Add')
      expect(dynamic_controls_page.checkbox_form).to have_content('A checkbox')

      dynamic_controls_page.click_on_checkbox_add_or_remove('Remove')
      expect(dynamic_controls_page.has_checkbox?).to be false
      # This step is broken, because if the user removes the checkbox twice...
      # checkbox text 'a checkbox' remains on the screen
      expect(dynamic_controls_page.checkbox_form).to have_no_content('A checkbox')
    end
  end
end
