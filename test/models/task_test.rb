require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @category = Category.create(title: 'Test')
  end

  teardown do
    Rails.cache.clear
  end

  test "should create task under existing category" do
    task = @category.tasks.build(title: 'task', description: 'description', deadline: DateTime.now.tomorrow.to_date)
    assert_difference '@category.tasks.count', 1 do
      task.save
    end
  end

  test "should not save task without name" do
    task = @category.tasks.build(description: 'description', deadline: DateTime.now.tomorrow.to_date)
    assert_not task.save, "Saved task without name"
  end

  test "should not save task with taken name" do
    task = @category.tasks.build(title: 'task', description: 'description', deadline: DateTime.now.tomorrow.to_date)
    task.save
    task2 = @category.tasks.build(title: 'task', description: 'description', deadline: DateTime.now.tomorrow.to_date)
    assert_not task2.save, "Saved task with taken name"
  end
end
