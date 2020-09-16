class PermitSubmissionsController < ApplicationController
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  layout 'application'

  def index
    @search = permit_index_params.fetch(:search, nil)
    @permits = if sort_column && sort_direction
                 current_user.permit_submissions.order("#{sort_column} #{sort_direction}")
               else
                 current_user.permit_submissions
               end
    @permits = @permits.search_permits(@search) if @search.present?
    @alert = Alert.order('created_at DESC').first
  end

  def show
    @permit = PermitSubmission.find(params.fetch(:id))
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

  def update
    @permit = current_team.permit_submissions.find(params.fetch(:id))
    return unless @permit.update!(permit_params)

    redirect_to permit_submission_path(@permit)
  end

  def destroy
    @permit = current_user.permit_submissions.find(params.fetch(:id))
    @permit.destroy!
    redirect_to permit_submissions_path
  end

  private

  def permit_index_params
    params.permit(:sort_by, :search)
  end

  def permit_params
    params.require(:permit_submission).permit(:name, :user_id, :agency, :deadline, :status,
                                              :permittee, :location, :equipment, :permit_type_id,
                                              :tag_list, permit_documents_attributes: %i[document _destroy id])
  end

  def permit_document_params
    params.fetch(:permit_documents, {}).permit(:document, {}).fetch(:document, nil)
  end

  def sortable_columns
    ["name", "agency", "permit_type_id", "deadline", "status", "permittee", "equipment", "location"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
