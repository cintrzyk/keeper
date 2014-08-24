class DashboardController < ApplicationController
  def index
    @item = Item.new
    @items = current_user.items.order created_at: :desc
  end
end
