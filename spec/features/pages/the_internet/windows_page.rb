class WindowsPage < SitePrism::Page
  set_url ENV['WINDOWS_SITE']
  element :click_here_link, 'a', text: 'Click Here'

  @windows_page = WindowsPage.new
  @windows_page.load
end
