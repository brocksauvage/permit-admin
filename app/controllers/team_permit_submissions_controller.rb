class TeamPermitSubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  layout 'application'

  def index
    sort_by = permit_params[:sort_by]
    @team = current_team
    @permits = if sort_by
                 current_team.permit_submissions.order(sort_by)
               else
                 current_team.permit_submissions
               end
  end

  def show
    @team = current_team
    @permit = current_team.permit_submissions.find(permit_params[:permit_id])
  end

  def destroy
    @permit = current_team.permit_submissions.find(permit_params[:permit_id])
    if @permit.destroy!
      redirect_to team_permit_submissions_path(team_id)
    end
  end

  private

  def permit_params
    params.permit(:team_id, :sort_by, :permit_id)
  end
end
