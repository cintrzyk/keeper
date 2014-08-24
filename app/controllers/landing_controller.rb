class LandingController < ApplicationController
  skip_before_action :signup_required
  before_action :goto_dashboard

  private

  def goto_dashboard
    return unless signed_in?
    redirect_to dashboard_path
  end
end
