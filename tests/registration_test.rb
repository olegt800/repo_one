require 'selenium-webdriver'
require 'test/unit'

class RegistrationTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end


  def test_positive_registration
    go_to_home_page
    login = rand(999).to_s + 'login'
    @browser.find_element(:class, 'register').click
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys 'ererere'
    @browser.find_element(:id, 'user_password_confirmation').send_keys 'ererere'
    @browser.find_element(:id, 'user_firstname').send_keys 'ererere'
    @browser.find_element(:id, 'user_lastname').send_keys 'ererere'
    @browser.find_element(:id, 'user_mail').send_keys login + '@dfdfd.dfd'

    @browser.find_element(:name, 'commit').click

    expected = 'Your account has been activated. You can now log in.'
    assert_equal(expected, @browser.find_element(:id, 'flash_notice').text)
  end

  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end


  def teardown
    @browser.quit
  end

end