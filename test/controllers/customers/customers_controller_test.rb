require 'test_helper'

class Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_customers_new_url
    assert_response :success
  end

  test "should get show" do
    get customers_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_customers_update_url
    assert_response :success
  end

  test "should get confirm" do
    get customers_customers_confirm_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_customers_destroy_url
    assert_response :success
  end

end
