class OrderMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
#START:received
  def received(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end
#END:received

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
#START:shipped
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
#END:shipped
end
