require 'test_helper'

class CategoryControllerTest < ActionController::TestCase

  test " should get category index" do
    get :index
    assert_response :success

  end
  test " should get now" do
    get :new
    assert_response :success     
  end
  test " should get show" do
    get :show
    assert_response :success    
  end
end  