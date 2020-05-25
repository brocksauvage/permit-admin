class PermitsController < ActionController::Base
  before_action :authenticate_user!

  layout 'application'

  def index
    @permits = current_user.permit_submissions
  end

  def new
    @permit = current_user.permit_submissions.build
  end

  def create
    @permit = PermitSubmission.new(permit_params)
    if @permit.save!
      redirect_to permits_path, :flash => { success: "You saved your permit" }
    else
      render :new, :flash => { error: "Could not save" }
    end
  end

  private
  def permit_params
    params.require(:permit).permit(:name, :agency, :deadline, :status).merge(user_id: current_user.id)
  end
end
