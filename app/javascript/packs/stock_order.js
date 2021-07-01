


$("#stock-quantity").on("input", function () {
   $("#order-price").val($("#stock-quantity").val() * $("#stock-price").val() )
});