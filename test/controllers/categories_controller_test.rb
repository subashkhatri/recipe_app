require 'test_helper'

class CategoryControllerTest < ActionController::TestCase
  def set_up
    @category = Category.create(name: 'spices')
  end

  test ' should get category index' do
    get :index
    assert_response :success
  end
  test ' should get now' do
    get :new
    assert_response :success
  end
  test ' should get show' do
    get(:show, { 'id' => @category.id })
    assert_response :success
  end
end
