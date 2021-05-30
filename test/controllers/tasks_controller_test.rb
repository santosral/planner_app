require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(title: 'Task')
    @task = @category.tasks.build(title: 'task', description: 'description', deadline: DateTime.now.tomorrow)
    @task.save
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create new task" do
    post category_tasks_path(@category), params: { task: { title: "task", description: 'description' } }
    assert_response :redirect
  end

  test "should show existing task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should edit an existing task" do
    get category_task_path(@category, @task)
    assert_response :success

    patch category_task_path(@category, @task), params: { task: { title: "task", description: 'description' } }
    assert_response :redirect
  end

  test "should delete an existing category" do
    get category_task_path(@category, @task)
    assert_response :success

    delete category_task_path(@category, @task)
    assert_response :redirect
  end
end
