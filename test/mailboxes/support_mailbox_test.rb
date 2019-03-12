# frozen_string_literal: true

require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "email with an order" do
    receive_inbound_email_from_mail to: "support@example.com",
      from: orders(:one).email,
      subject: "I need help with my order",
      body: "It does not seem to have shipped yet!"

    support_request = SupportRequest.last
    assert_equal "I need help with my order\n\nIt does not seem to have shipped yet!", support_request.request
    assert_equal orders(:one), support_request.order
    assert_nil support_request.response
  end

  test "email without an order" do
    receive_inbound_email_from_mail to: "support@example.com",
      from: "chris@blah.com",
      subject: "I need help with my order",
      body: "It does not seem to have shipped yet!"

    support_request = SupportRequest.last
    assert_equal "I need help with my order\n\nIt does not seem to have shipped yet!", support_request.request
    assert_nil support_request.order
    assert_nil support_request.response
  end
end
