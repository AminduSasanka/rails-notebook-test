class CommentsController < ApplicationController
  before_action :authenticate_user!

  def update
    logger.info "\n\n\n comments controller update action with params \n #{params} \n\n\n"

    @note = Note.find(params[:note_id])
    @comment = @note.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to subject_note_path(@note.subject, @note), notice: 'Your feedback was updated' }
      else
        format.html { redirect_to subject_note_path(@note.subject, @note), notice: 'Your feedback was not updated' }
      end
    end
  end

  def create
    logger.info "\n\n\n comments controller create action with params \n #{params} \n\n\n"

    @note = Note.find(params[:note_id])
    comment = @note.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = 'comment is created'
      redirect_to subject_note_path(@note.subject, @note)
    else
      flash[:alert] = 'comment is not created'
      redirect_to subject_note_path(@note.subject, @note)
    end
  end

  def destroy
    logger.info "\n\n\n comments controller destroy action with params \n #{params} \n\n\n"

    comment = Comment.find(params[:id])
    return unless comment.destroy

    flash[:notice] = 'comment is deleted'
    redirect_to subject_note_path(comment.note.subject, comment.note)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
