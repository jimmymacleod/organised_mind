class NotesController < ApplicationController

  def new
    @note = Note.new
    @days = Day.all
  end

  def day_note_new
    @day = Day.find params[:id]
    @note = Note.create
    @note.day_id = @day.id
  end

  def day_note_create
    @note = Note.create note_params
    @note.day_id = Day.find params[:id]
    redirect_to days_today_path
  end

  def create
    Note.create note_params
    redirect_to notes_path
  end

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find params[:id]
  end

  def edit
    @note = Note.find params[:id]
    @days = Day.all
  end

  def update
  @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note
    else
      flash[:errors] = note.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :detail, :image, :day_id)
  end

end
