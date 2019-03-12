import React           from 'react'              // <callout id="co.payment-details.pay_type.import-react"/>
import ReactDOM        from 'react-dom'           // <callout id="co.payment-details.pay_type.import-react-dom"/>
import PayTypeSelector from 'PayTypeSelector'     // <callout id="co.payment-details.pay_type.import-PayTypeSelector"/>

document.addEventListener('turbolinks:load', function() {       // <callout id="co.payment-details.pay_type.DOMContentLoaded"/>
  var element = document.getElementById("pay-type-component"); // <callout id="co.payment-details.pay_type.getElementById"/>
  ReactDOM.render(<PayTypeSelector />, element);                 // <callout id="co.payment-details.pay_type.jsx"/>
});
