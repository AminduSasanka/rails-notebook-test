class LecturesController < ApplicationController
  def show
    logger.info "\n\n lectures conroller show action with params \n #{params} \n\n"
    @lecture = Lecture.find(params[:id])
  end
end
