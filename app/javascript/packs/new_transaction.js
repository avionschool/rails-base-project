const selectTransactionBuy = document.querySelector(".transaction_type_buy_button");
const selectTransactionSell = document.querySelector(".transaction_type_sell_button");
const submitTransaction = document.querySelector(".submit__transaction");

selectTransactionBuy.addEventListener('click', () => {
  submitTransaction.classList.add('buy')
  submitTransaction.classList.remove('sell')
})

selectTransactionSell.addEventListener('click', () => {
  submitTransaction.classList.add('sell')
  submitTransaction.classList.remove('buy')
})
