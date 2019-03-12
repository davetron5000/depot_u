#START:setup
class StoreController < ApplicationController
#START_HIGHLIGHT
  skip_before_action :authorize
#END_HIGHLIGHT
#END:setup
#START_HIGHLIGHT
  include CurrentCart
  before_action :set_cart
#END_HIGHLIGHT
#START:index
  def index
#START_HIGHLIGHT
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
#END_HIGHLIGHT
      @products = Product.order(:title)
#START_HIGHLIGHT
    end
#END_HIGHLIGHT
  end
#END:index
end
