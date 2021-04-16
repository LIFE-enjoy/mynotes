class NotesController < ApplicationController
  before_action :set_index, only: [:index, :new, :edit]
  before_action :set_note, only: [:edit, :update,:destroy]

  def index
  end

  def new
    @note = Note.create(title:'新規メモ',content:'')
  end

  def create
    @note = Note.create(note_params)
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to action: :edit
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :content,)
  end

  def set_index
    @notes = Note.all.order(id: "DESC")
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
