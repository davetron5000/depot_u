class ChargeOrderJob < ApplicationJob
  queue_as :default

  # START_HIGHLIGHT
  def perform(order,pay_type_params)

    order.charge!(pay_type_params)
  # END_HIGHLIGHT

  end
end
