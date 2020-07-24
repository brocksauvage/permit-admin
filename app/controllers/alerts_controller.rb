class AlertsController < ApplicationController
  def index
    @search = alert_index_params.fetch(:search, nil)
    @alerts = Alert.all.order("created_at DESC")
    @alerts = @alerts.search_by_body(@search) if @search.present?
  end

  private

  def alert_index_params
    params.permit(:search)
  end

end
