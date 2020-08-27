require 'test_helper'

class RootsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get roots_top_url
    assert_response :success
  end

end
