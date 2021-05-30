require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without title" do
    category = Category.new
    assert_not category.save, "Saved the category without a title"
  end

  test "should not save category with title less than two characters" do
    category = Category.new
    category.title = "A"
    assert_not category.save, "Saved the category with title less than two characters"
  end

  test "should not save category with title more than twenty characters" do
    category = Category.new
    category.title = "AAAAAAAAAAAAAAAAAAAAA"
    assert_not category.save, "Saved the category with title more than twenty characters"
  end

  test "should not save category with description less than ten characters" do
    category = Category.new
    category.description = "AAAAAAAAA"
    assert_not category.save, "Saved the category with description less than ten characters"
  end

  test "should not save category with taken name" do
    category = Category.new(title: 'category', description: 'description')
    category.save
    category2 = Category.new(title: 'category', description: 'description')
    assert_not category2.save, "Saved category with taken name"
  end
end