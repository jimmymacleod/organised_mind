class TasksController < ApplicationController

  def new
    @task = Task.new
    @days = Day.all
  end

  def create
    Task.create task_params
    redirect_to tasks_path
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

  def edit
    @task = Task.find params[:id]
    @days = Day.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
        redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :importance, :day_id)
  end

end
