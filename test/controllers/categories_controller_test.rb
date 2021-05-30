require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to root_path
  end

  test "should update category" do
    patch category_url(@category), params: { category: { title: "updated" } }

    assert_redirected_to category_path(@category)
    @category.reload
    assert_equal "updated", @category.title
  end
end
