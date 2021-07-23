const { start } = require("@popperjs/core")

// For Guest quantity and Total price
$("#guest_quantity").on("input", function(){
    $("#total_price").val($("#guest_quantity").val() * Number($("#tour-price").attr('data-price')))
}) 


// For Date and Duration

$("#start-date").on("input", function(){
    let duration = Number($("#tour-duration").attr('data-duration'))
    let start_date = new Date($("#start-date").val())
    console.log(duration)
    console.log($("#start-date").val())
    let end_date = new Date(start_date.setDate(new Date($("#start-date").val()).getDate() + duration))
    let new_month = `${end_date.getMonth()+1 < 9 ? '0' : ''}${end_date.getMonth() + 1}`
    let new_day = `${end_date.getDate() < 9 ? '0': ''}${end_date.getDate()}`

    $("#end-date").val(`${end_date.getFullYear()}-${new_month}-${new_day}`)
    console.log(`${end_date.getFullYear()}-${new_month}-${new_day}`)
})