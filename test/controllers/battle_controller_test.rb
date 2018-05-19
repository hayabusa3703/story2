require 'test_helper'

class BattleControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get battle_test_url
    assert_response :success
  end

end
