class TasksController < ApplicationController

  before_action :set_task, only: %i[show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show; end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :status, :finished_at, :deadline)
  end

end
