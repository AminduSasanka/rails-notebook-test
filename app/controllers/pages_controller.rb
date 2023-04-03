class PagesController < ApplicationController
  def home
    @subjects = Subject.all
  end

  def index
    @appoinments = Appoinment.where(user_id: current_user.id) if user_signed_in?
  end
end
