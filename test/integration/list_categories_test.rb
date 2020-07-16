require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
 def setup
  @category1 = Category.create(name: "spices")
  @category2 = Category.create(name: "italian")
  test "should show categories listing " do 
    get new_categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@category1), text: @category:name
    assert_select "a[href=?]", category_path(@category2), text: @category:name
     
  end
 end
end