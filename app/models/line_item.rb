class LineItem < ApplicationRecord
#START_HIGHLIGHT
  belongs_to :order, optional: true
#END_HIGHLIGHT
#START_HIGHLIGHT
  belongs_to :product, optional: true
#END_HIGHLIGHT
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
