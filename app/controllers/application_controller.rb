class ApplicationController < ActionController::Base
  private

  def current_team
    current_user.team
  end

  def authorize_admin!
    redirect_to permit_submissions_path unless user_signed_in? && current_user.manager?
  end
end
