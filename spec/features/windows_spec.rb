require_relative 'pages/the_internet/windows_page'

feature 'The "Windows" page allows users to open a new Window' do
  let(:windows_page) { WindowsPage.new }

  describe 'When i am a user in Windows page' do
    before(:each) do
      windows_page.load
      expect(page).to have_content 'Opening a new window'
    end

    it 'I click on a link, and check the new Window on new browser tab' do
      expect(page.current_path).to eq('/windows')
      new_windows_page = window_opened_by do
        windows_page.click_here_link.click
      end
      within_window new_windows_page do
        expect(page).to have_content 'New Window'
        expect(page.current_path).to eq('/windows/new')
      end
    end
  end
end
