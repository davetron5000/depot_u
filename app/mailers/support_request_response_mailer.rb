class SupportRequestResponseMailer < ApplicationMailer
  def respond(support_request)
    @support_request = support_request
    mail to: support_request.order.email, from: "support@example.com"
  end
end
