class SupportMailbox < ApplicationMailbox
  def process
    existing_order = Order.where(email: mail.from_address.to_s).order('created_at desc').first
    SupportRequest.create!(order: existing_order, request: mail.subject + "\n\n" + mail.body.to_s)
  end
end
