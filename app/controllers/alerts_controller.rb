class AlertsController < ApplicationController

  def index
    @alerts = Alert.all.order("created_at DESC")
  end

end
