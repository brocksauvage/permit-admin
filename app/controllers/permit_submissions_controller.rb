class PermitSubmissionsController < ApplicationController
  before_action :authenticate_user!

  layout 'application'

  def index
    sort_by = permit_index_params.fetch(:sort_by, nil)
    @search = permit_index_params.fetch(:search, nil)
    @permits = if sort_by
                 current_user.permit_submissions.order(sort_by)
               else
                 current_user.permit_submissions
               end
    @permits = @permits.search_permits(@search) if @search.present?
    @alert = Alert.order('created_at DESC').first
  end

  def show
    @permit = current_user.permit_submissions.find(params.fetch(:id))
  end

  def create
    @permit = PermitSubmission.new(permit_params)
    if @permit.save!
      @permit_document = @permit.permit_documents.create!
      @permit_document.document.attach(permit_document_params)
      @permit_document.save!
      redirect_to permit_submissions_path, flash: { success: 'You saved your permit' }
    else
      render :new, flash: { error: 'Could not save' }
    end
  end

  def new
    @permit = current_user.permit_submissions.build
  end

  def edit
    @permit = current_user.permit_submissions.find(params.fetch(:id))
  end

  private

  def permit_index_params
    params.permit(:sort_by, :search)
  end

  def permit_params
    params.require(:permit).permit(:name, :agency, :deadline, :status).merge(user_id: current_user.id)
  end

  def permit_document_params
    params.fetch(:permit_documents, {}).permit(:document, {}).fetch(:document, nil)
  end
end
