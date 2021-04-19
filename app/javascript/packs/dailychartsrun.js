console.log("i am connected")
var Dailychart = require('dailychart');
// Dailychart.create('#chart', { lineWidth: 2 });
width = document.getElementById("market").clientWidth;
Dailychart.create('#chart-fill-positive', {
    fillPositive: '#d6efda',
    fillNegative: '#d6efda',
    colorPositive: '#33AE45',
    colorNegative: '#33AE45',
    closeColor: '',
    lineWidth: 1.5,
    width:width
  });

Dailychart.create('#chart-fill-negative', {
    fillPositive: '#fbdddd',
    fillNegative: '#fbdddd',
    colorPositive: '#EB5757',
    colorNegative: '#EB5757',
    closeColor: '',
    lineWidth: 1.5,
    width:width
});

//   var myImg = document.getElementById("sky");
//         var currWidth = myImg.clientWidth;

// width = document.getElementById("market").clientWidth;
// charts = document.querySelectorAll(".chart-fill")
// charts.forEach(chart => {
//     chart.style.width = width;
// });