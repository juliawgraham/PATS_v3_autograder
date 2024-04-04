require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "should raise CanCan exception" do
    login_client
    get pets_path
    assert_equal "You are not authorized to take this action.  Go away or I shall taunt you a second time.", flash[:error]
    assert_redirected_to home_path
  end
  
  test "should raise 404 for non-existent pet" do
    login_worker
    get pet_path(999)
    assert_equal "Seek and you shall find... but not this time", flash[:error]
    assert_redirected_to home_path
  end

end
