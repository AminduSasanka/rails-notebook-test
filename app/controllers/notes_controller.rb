class NotesController < ApplicationController
  def show
    logger.info "\n\n Notes controller show action running \n with params : #{params} \n\n"
    @note = Note.find(params[:id])
    @comments = Comment.where(note_id: params[:id])
  end
end
