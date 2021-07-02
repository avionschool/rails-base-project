document.getElementById("qty").addEventListener("input", function() {
  var role = document.getElementById("stock_broker_role").value;
  var action = document.getElementById("stock_action_made").value;
  if (role === "Buyer") {
    var qty = document.getElementById("qty").value;
    var price = document.getElementById("price").innerHTML;
    var total = parseFloat(qty) * parseFloat(price)
    document.getElementById("total").innerHTML = total.toFixed(2) + " $";
  } else {
    var qty = document.getElementById("qty").value;
    var price = document.getElementById("price").innerHTML;
    var total = parseFloat(qty) * parseFloat(price)
    document.getElementById("total").innerHTML = total.toFixed(2) + " $";
    if (action === "buy") {
      var newtotal = parseFloat(qty) * (parseFloat(price) * 0.95)
      document.getElementById("newtotal").innerHTML = newtotal.toFixed(2) + " $";
    } else {
      var newtotal = parseFloat(qty) * (parseFloat(price) * 1.05)
      document.getElementById("newtotal").innerHTML = newtotal.toFixed(2) + " $";
    }
  }
});
