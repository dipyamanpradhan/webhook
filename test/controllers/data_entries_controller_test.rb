require "test_helper"

class DataEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get data_entries_create_url
    assert_response :success
  end

  test "should get update" do
    get data_entries_update_url
    assert_response :success
  end
end
