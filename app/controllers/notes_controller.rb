class NotesController < ApplicationController

  def new
    @note = Note.new
    @days = @current_user.days
  end

  def create
    note = Note.create note_params
    note.user = @current_user

    if note.save
      redirect_to notes_path
    else
      # day did not get saved, show an errors
      flash[:errors] = note.errors.full_messages
      @note = Note.new note_params   # prefill form with values already entered
      render :new
    end
  end

# --------------------------------------------------
  #  Is this working?
  #  Not onto this yet

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

  # ------------------

  def index
    @days = @current_user.days
    @notes = @current_user.notes
    @misc = @current_user.notes.where day_id: nil 
  end

  # ------------------

  def show
    @note = Note.find params[:id]
  end

  def edit
    @note = Note.find params[:id]
    @days = @current_user.days
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
    params.require(:note).permit(:title, :detail, :image, :day_id, :user_id)
  end

end
