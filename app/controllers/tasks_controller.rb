class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
      @tasks = Task.all.order(id: "DESC")

      if params[:sort_deadline]
        @tasks = Task.all.order(deadline: "ASC")
      end
      if params[:sort_importance]
        @tasks = Task.all.order(importance: "ASC")
      end



      if params[:search].present?
        if params[:title].present? and params[:importance].present?
          @tasks = @tasks.title_search params[:title]
          @tasks = @tasks.importance_search params[:importance]
        elsif params[:title].present?
          @tasks = @tasks.title_search params[:title]
        elsif params[:importance].present?
          @tasks = @tasks.importance_search params[:importance]
        end
      end
    end
    def new
      @task = Task.new
    end
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path, notice: "追加しました！"
      else
        render :new
      end
    end
    def show
    end
    def edit
    end
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: "編集しました！"
      else
        render :edit
      end
    end
    def destroy
        @task.destroy
        redirect_to tasks_path, notice:"削除しました！"
    end
    private
    def task_params
      params.require(:task).permit(:title, :content, :rink, :deadline, :importance, :image)
    end
    def set_task
        @task = Task.find(params[:id])
      end
  end