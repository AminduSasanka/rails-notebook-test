class AppoinmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lecture

  def new
    logger.info "\n\n\n appoinments controller action new with params \n #{params} \n\n\n"

    # check if the seat is aleready reserved first.
    # if already reserved then send response saying 'aleready reserved'.
    # if not then try to make a new reservation.
    if Appoinment.find_by(user_id: current_user.id, lecture_id: params[:lecture_id])
      respond_to do |format|
        format.html do
          redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'Yout seat is already reserved'
        end
      end
    else

      appoinment = @lecture.appoinments.new(lecture_id: @lecture.id, user_id: current_user.id)

      # try to save the appoinment
      if appoinment.save
        logger.info "\n\n\n appoinment saved \n\n\n"
        respond_to do |format|
          format.html { redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'Yout seat is reserved' }
        end
      else
        logger.info "\n\n\n appoinment not saved \n\n\n"
        respond_to do |format|
          format.html do
            redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'Yout seat is reserved',
                                                                          status: :unprocessable_entity
          end
        end
      end

    end
  end

  def destroy
    logger.info "\n\n\n appoinments controller action destroy with params \n #{params} \n\n\n"

    appoinment = Appoinment.find_by(user_id: current_user.id, lecture_id: params[:lecture_id])

    # check if appoinment is already made.
    # if true then try to destroy the record.
    # if not then send response 'you have not reseved a seat'
    if appoinment

      if appoinment.destroy
        respond_to do |format|
          format.html do
            redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'Yout seat reservation is removed'
          end
        end
      else
        respond_to do |format|
          format.html do
            redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'Something went wrong.Try again later'
          end
        end
      end

    else
      respond_to do |format|
        format.html do
          redirect_to subject_lecture_path(@lecture.subject, @lecture), notice: 'You have not reserved your seat'
        end
      end
    end
  end

  private

  # setting lecture with lecture id
  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
end
