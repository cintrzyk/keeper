class DashboardController < ApplicationController
  def index
    @item = Item.new
    @items = Item.order created_at: :desc
  end
end
