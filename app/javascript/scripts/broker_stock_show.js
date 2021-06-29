window.addEventListener('click', displayShow);

function displayShow(){
    if(document.querySelector('body').className == "broker_stocks-show"){
        let button = document.querySelector('#confirm-quantity')
        button.addEventListener('click', displayValue)
        button.style.cursor = 'pointer';
    }
}

function displayValue(){
    let quantity = document.querySelector('#quantity');
    let total_price = document.querySelector('#total_price');
    let latest_price = document.querySelector('#latest_price');
    let value = parseFloat(quantity.value);
    total_price.value = value * parseFloat(latest_price.dataset.price)

}