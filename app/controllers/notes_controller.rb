class NotesController < ApplicationController

  def new
    @note = Note.new
    @days = Day.all
  end

  def day_note
    @day = Day.find params[:id]
    @note = Note.create
    # @note.id = "1X#{SecureRandom.hex(3)}"
    # @note.title = "New Note"
    # @note.detail = "Update Content"
    # @note.image = "Image URL"
    # @note.day_id = @day.id
    # {:title => 'New Note', :detail => 'Update Content', :image => "Image URL", :day_id => @day.date}
    @days = Day.all
    @note.save
  end

  def create
  @note = Note.create note_params
    # if @note.day_id = nil
      redirect_to notes_path
    # else
    #   redirect_to days_today_path
    # end
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
