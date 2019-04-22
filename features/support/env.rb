require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'selenium/webdriver'
require 'dotenv'

Dotenv.load # loads environment variables from .env file

# Default setting
@default_capybara_driver = :chrome
Capybara.app_host = ENV['DEFAULT_HOST']
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10

# CHROME
Capybara.register_driver :chrome do |app|
  # Use an existing profile
  profile = Selenium::WebDriver::Chrome::Profile.new

  profile["network.proxy.http"] = ENV['PROXY_HOST']
  profile["network.proxy.http_port"] = ENV['PROXY_PORT']

  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                 profile: profile)
end


#Firefox
Capybara.register_driver :selenium do |app|
  # Use an existing profile
  profile = Selenium::WebDriver::Firefox::Profile.new

  profile.proxy = Selenium::WebDriver::Proxy.new(http: ENV['PROXY_HOST'])

  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)

end

Capybara.default_driver = case ENV['DRIVER']
                          when 'firefox' then :selenium
                          when 'chrome' then  :chrome
                          else @default_capybara_driver
                          end

