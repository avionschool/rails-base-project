$("#stock-quantity").on("input", function () {
   let order_price = $("#stock-quantity").val() * $("#stock-price").val() 
   let broker_fee  = order_price * ($("#brokerage-fee").val()/100)
   $("#order-price").val(Math.round(order_price * 100) / 100)
   if ($("#action-type").val() == 'buy') {
      $("#total-price").val(Math.round((order_price + broker_fee) * 100) / 100)
   } else {
      $("#total-price").val(Math.round((order_price - broker_fee) * 100) / 100)
   }

});