class DaysController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def home
    if @current_user
      @days = @current_user.days
      @tasks = @current_user.tasks
      @notes = @current_user.notes
    else
      redirect_to login_path
    end
  end

  def today

    # If there is an database entry with the current date, redirect to that entrys show page, ELSE create new entry.

    @day = Day.create_with(journal: 'Your journal goes here.').find_or_create_by date: Time.now, user: @current_user

    #
    # @day = Day.find_or_create_by date: Time.now, user: @current_user
    #
    # if Day.all.find_by date:Time.now
    #   day = Day.all.find_by date:Time.now
    #   redirect_to day_path(day)
    # else
    #   @day = Day.create
    #   @day.date = Time.now.strftime("%Y-%m-%d")
    #   @day.journal = "Edit contents"
    #   @day.image = "Image URL"
    #   @day.save
    # end
  end

  def new
    @day = Day.new
  end

  def create
    day = Day.new days_params
    day.user = @current_user


    if day.save
      redirect_to days_path
    else
      # day did not get saved, show an errors
      flash[:errors] = day.errors.full_messages
      @day = Day.new days_params   # prefill form with values already entered
      render :new
    end

  end

  def index
    if @current_user.days.present?
      @days = @current_user.days.order(:date).reverse
    end
  end

  def show
    @day = Day.find params[:id]
  end

  def edit
    @day = Day.find params[:id]
  end

  def update
  @day = Day.find(params[:id])
    if @day.update(params[:day].permit(:date, :journal, :image))
      redirect_to @day
    else
      render 'edit'
    end
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
    redirect_to days_path
  end

  private
  def days_params
    params.require(:day).permit(:date, :journal, :image)
  end


end
