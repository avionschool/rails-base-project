console.log("i am connected")

// const loading = () => {
//   const loader = document.querySelector(".loader");
//   loader.className += " hidden"; // class "loader hidden"
// }
// // document.getElementById("pages-container")
// window.addEventListener("load", loading());
// window.removeEventListener("mousemove", loading());

var Dailychart = require('dailychart');
Dailychart.create('#chart', { lineWidth: 2 });



// Select the node that will be observed for mutations
var targetNode = document.getElementById("stock-searched");

// Options for the observer (which mutations to observe)
var config = { attributes: true, childList: true };

// Callback function to execute when mutations are observed
var callback = function(mutationsList) {
    for(var mutation of mutationsList) {
        if (mutation.type == 'childList') {
            console.log('A child node has been added or removed.');
            drawFunction()
        }
        else if (mutation.type == 'attributes') {
            console.log('The ' + mutation.attributeName + ' attribute was modified.');
        }
    }
};

// Create an observer instance linked to the callback function
var observer = new MutationObserver(callback);

// Start observing the target node for configured mutations
observer.observe(targetNode, config);

// Later, you can stop observing
// observer.disconnect();



const drawFunction = () => {
  console.log("hello")
  width = document.getElementById("market").clientWidth;

  if (width) {
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
  }
};


//   var myImg = document.getElementById("sky");
//         var currWidth = myImg.clientWidth;

// width = document.getElementById("market").clientWidth;
// charts = document.querySelectorAll(".chart-fill")
// charts.forEach(chart => {
//     chart.style.width = width;
// });