class TasksController < ApplicationController

  def new
    @task = Task.new
    @days = @current_user.days
  end

  def create

    task = Task.create task_params
    task.user = @current_user

    if task.save
      redirect_to tasks_path
    else
      flash[:errors] = note.errors.full_messages
      @task = Task.new days_params   # prefill form with values already entered
      render :new
    end
  end

  def index
    @tasks = @current_user.tasks
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
    params.require(:task).permit(:name, :description, :importance, :day_id, :user_id)
  end

end
