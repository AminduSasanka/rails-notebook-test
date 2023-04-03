class SubjectsController < ApplicationController
  def show
    logger.info "\n\n Subjects controller show action running \n with params : #{params} \n\n"
    @subject = Subject.find(params[:id])
    @notes = @subject.notes
  end
end
