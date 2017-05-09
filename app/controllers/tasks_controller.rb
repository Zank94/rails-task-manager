class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_done]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def mark_as_done
    @task.done ? @task.done = false : @task.done = true
    @task.save
    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
