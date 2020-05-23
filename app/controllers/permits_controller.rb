class PermitsController < ActionController::Base
  layout 'application'

  def index
    PermitSubmission.create(title: "Foo")
    @permits = PermitSubmission.all
  end
end
