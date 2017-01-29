require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get goindex" do
    get welcome_goindex_url
    assert_response :success
  end

end
