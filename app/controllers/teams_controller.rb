class TeamsController < ApplicationController
  before_action :authenticate_user!

  layout 'application'

  def show
    @team = current_team
  end

  private

  def permit_params
    params.require(:team_id)
  end
end
