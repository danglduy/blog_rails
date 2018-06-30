require 'test_helper'

class MasterControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get master_home_url
    assert_response :success
  end

  test "should get help" do
    get master_help_url
    assert_response :success
  end

  test "should get about" do
    get master_about_url
    assert_response :success
  end

  test "should get contact" do
    get master_contact_url
    assert_response :success
  end

end
