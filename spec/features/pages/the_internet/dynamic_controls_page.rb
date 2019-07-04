class DynamicControlsPage < SitePrism::Page
  set_url ENV['DYNAMIC_CONTROLS_SITE']
  element :checkbox, '#checkbox'
  element :checkbox_form, 'form[id="checkbox-example"]'
  element :loading, 'div[id="loading"]'

  @dynamic_controls_page = DynamicControlsPage.new
  @dynamic_controls_page.load

  def click_on_checkbox_add_or_remove(action)
    checkbox_form.click_button(action)
    wait_until_loading_visible(wait: 1)
    wait_until_loading_invisible(wait: 5)
  end
end
