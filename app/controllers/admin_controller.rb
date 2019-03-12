class AdminController < ApplicationController
  def index
#START_HIGHLIGHT
    @total_orders = Order.count
#END_HIGHLIGHT
  end
end
