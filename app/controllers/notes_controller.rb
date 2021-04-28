class NotesController < ApplicationController
  before_action :set_index, only: [:index, :new, :edit]
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :move_index, except: :index

  def index
  end

  def new
    @note = Note.create(title:'新規メモ',content:'',user_id: current_user.id)
  end

  def create
    @note = Note.create(note_params)
  end

  def edit
    
  end
  
  def update
    if @note.user.id == current_user.id
      @note.update(note_params)
      redirect_to action: :edit
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ""
    note = Note.where(['title LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: note }
  end

  private
  def note_params
    params.require(:note).permit(:title, :content,:action_text).merge(user_id: current_user.id)
  end

  def set_index
    @notes = Note.where(user_id: current_user.id).order(id: "DESC")
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def move_index
    redirect_to action: :index if current_user.id != @note.user.id
  end
end
