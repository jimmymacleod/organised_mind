class DaysController < ApplicationController
  def home
    @days = Day.all
    @tasks = Task.all
    @notes = Note.all
  end

  def today

    # If there is an database entry with the current date, redirect to that entrys show page, ELSE create new entry.

    if Day.all.find_by date:Time.now
      day = Day.all.find_by date:Time.now
      redirect_to day_path(day)
    else
      @day = Day.create
      @day.date = Time.now.strftime("%Y-%m-%d")
      @day.journal = "Edit contents"
      @day.image = "Image URL"
      @day.save
    end
  end

  def new
    @day = Day.new
  end

  def create
    Day.create days_params
    redirect_to days_path
  end

  def index
    @days = Day.all.order(:date).reverse
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
