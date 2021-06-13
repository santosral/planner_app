class TasksController < ApplicationController
    before_action :get_category

    def show
        @task = @category.tasks.find(params[:id])
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
    end

    def edit
    @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
    
        if @task.update(task_params)
          redirect_to category_path(@category)
        else
          render :edit
        end
    end
      
    def destroy
        @category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(@category)
    end
    
    private
        def task_params
            params.require(:task).permit(:title, :description, :deadline)
        end

        def get_category
            @category = current_user.Category.find(params[:category_id])
        end
end
