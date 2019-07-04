require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'webdrivers'
require 'capybara/rspec'
require 'dotenv'
require 'httparty'

Dotenv.load

if ENV['DRIVER'] == 'hub'
  url = ENV['DRIVER_URL']
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote,
                                   url: url,
                                   desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome)
  end
  Capybara.default_driver = :selenium
else
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: {
          args: %w[window-size=1366,768]
        }
      )
    )
  end
  Capybara.default_driver = :chrome
end


Capybara.configure do |config|
  config.run_server = false
  config.default_max_wait_time = 10
end
