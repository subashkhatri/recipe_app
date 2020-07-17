require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test 'get new category from and create category ' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: { name: 'spices' }
    end
    assert_template 'categories/index'
    assert_match 'spices', response.body
  end
  test 'Invalid category submission in failure' do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post_via_redirect categories_path, category: { name: ' ' }
    end
    assert_template 'categories/index'
    assert_match 'spices', response.body
  end
end
