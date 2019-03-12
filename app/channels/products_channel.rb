class ProductsChannel < ApplicationCable::Channel
  def subscribed
#START_HIGHLIGHT
    stream_from "products"
#END_HIGHLIGHT
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
