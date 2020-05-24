class PermitsController < ActionController::Base
  before_action :authenticate_user!

  layout 'application'

  def index
    PermitSubmission.create(title: "Foo")
    @permits = PermitSubmission.all
  end
end
