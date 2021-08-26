class TasksController < ApplicationController

  before_action :authenticate_user!, except: %i[index]
  before_action :set_task, only: %i[show start complete cancel]

  def index
    @tasks = Task.all
    @tasks0 = Task.where(status: 0)
    @tasks1 = Task.where(status: 1)
    @tasks2 = Task.where(status: 2)
    @tasks3 = Task.where(status: 3)
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

  def start
    @task.update_attribute(:status, 1)
    redirect_to tasks_path
  end

  def complete
    @task.update_attribute(:status, 2)
    @task.update_attribute(:finished_at, Time.now)
    redirect_to tasks_path
  end

  def cancel
    @task.update_attribute(:status, 3)
    @task.update_attribute(:finished_at,  Time.now)
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :status, :finished_at, :deadline)
  end

end
