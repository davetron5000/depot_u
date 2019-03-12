//START:import
import React from 'react'

import NoPayType            from './NoPayType';
import CreditCardPayType    from './CreditCardPayType';
import CheckPayType         from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';
// END:import

// START:bind
class PayTypeSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
    this.state = { selectedPayType: null };
  }
// END:bind

// START:onPayTypeSelected
  onPayTypeSelected(event) {
    this.setState({ selectedPayType: event.target.value });
  }
  // END:onPayTypeSelected

  // START:render
  render() {
    let PayTypeCustomComponent = NoPayType;
    if (this.state.selectedPayType == "Credit card") {
      PayTypeCustomComponent = CreditCardPayType;
    } else if (this.state.selectedPayType == "Check") {
      PayTypeCustomComponent = CheckPayType;
    } else if (this.state.selectedPayType == "Purchase order") {
      PayTypeCustomComponent = PurchaseOrderPayType;
    }
    return (
      <div>
        <div className="field">
          <label htmlFor="order_pay_type">
            {I18n.t("orders.form.pay_type")}
          </label>

          <select id="pay_type" onChange={this.onPayTypeSelected} 
            name="order[pay_type]">
            <option value="">
              {I18n.t("orders.form.pay_prompt_html")}
            </option>

            <option value="Check">
              {I18n.t("orders.form.pay_types.check")}
            </option>

            <option value="Credit card">
              {I18n.t("orders.form.pay_types.credit_card")}
            </option>

            <option value="Purchase order">
              {I18n.t("orders.form.pay_types.purchase_order")}
            </option>

          </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    );
  }
  // END:render
}
export default PayTypeSelector
