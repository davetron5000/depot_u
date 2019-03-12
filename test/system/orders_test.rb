require "application_system_test_case"


#START:test_helper
class OrdersTest < ApplicationSystemTestCase
  # START_HIGHLIGHT
  include ActiveJob::TestHelper
  # END_HIGHLIGHT
#END:test_helper
    
#START_HIGHLIGHT

# START:clear
  test "check routing number" do

    # START_HIGHLIGHT
    LineItem.delete_all
    Order.delete_all
    # END_HIGHLIGHT

    visit store_index_url
# END:clear

    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector "#order_routing_number"

    select 'Check', from: 'pay_type'


# START:fill_in
    assert_selector "#order_routing_number"

# START_HIGHLIGHT
    fill_in "Routing #", with: "123456"
    fill_in "Account #", with: "987654"
# END_HIGHLIGHT
# END:fill_in

# START:perform_enqueued_jobs
# START_HIGHLIGHT
    perform_enqueued_jobs do
      click_button "Place Order"
    end
# END_HIGHLIGHT
# END:perform_enqueued_jobs

# START:check_order
# START_HIGHLIGHT
    orders = Order.all
    assert_equal 1, orders.size

    order = orders.first

    assert_equal "Dave Thomas",      order.name
    assert_equal "123 Main Street",  order.address
    assert_equal "dave@example.com", order.email
    assert_equal "Check",            order.pay_type
    assert_equal 1, order.line_items.size
# END_HIGHLIGHT
# END:check_order

# START:check_mail
# START_HIGHLIGHT
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"],                 mail.to
    assert_equal 'Sam Ruby <depot@example.com>',       mail[:from].value
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
# END_HIGHLIGHT
# START:check_mail

  end 
#END_HIGHLIGHT
end
