class AlertsController < ApplicationController
  def index
    @alerts = Alert.order("created_at DESC")
  end
end
