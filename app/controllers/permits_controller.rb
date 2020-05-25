class PermitsController < ActionController::Base
  before_action :authenticate_user!

  layout 'application'

  def index
    @permits = PermitSubmission.all
  end
end
