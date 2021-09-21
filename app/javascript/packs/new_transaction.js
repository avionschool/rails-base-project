const selectTransaction = document.querySelector("#trade_transaction_type");
const submitTransaction = document.querySelector(".submit__transaction");
const quantityInput = document.querySelector("#trade_quatity");

function modifyTransactionType () {
  if (this.value == 'buy') {
    this.classList.add('buy')
    this.classList.remove('sell')
    submitTransaction.classList.add('buy')
    submitTransaction.classList.remove('sell')
  } else {
    this.classList.add('sell')
    this.classList.remove('buy')
    submitTransaction.classList.add('sell')
    submitTransaction.classList.remove('buy')
  }
}

selectTransaction.addEventListener('change', modifyTransactionType)
selectTransaction.addEventListener('load', modifyTransactionType)

selectTransaction.addEventListener('click', function () {
  if (this.value == 'buy') {
    this.style.borderColor = 'green'
  } else {
    this.style.borderColor = 'red'
  }
});
