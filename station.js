
var containerSeries = document.getElementById("timeSeriesList")

var colors = ["#B40404","#08088A","#F7FE2E","#04B404","#B40486","#3B170B"]
var timeSeries = [];

function getColor(){
	var color = colors.shift();
	colors.push(color);
	return color;
}



function processTimeSeries(event){
	var respond = event.target.responseText;
	timeSeries = JSON.parse(respond);
	var i;
	for (i=0; i< timeSeries.length; i++){
		var item = document.createElement("div")
		item.innerHTML = timeSeries[i].description;
		containerSeries.appendChild(item) 		
	}
}

function initialize(){
	// se pide las series de tiempo
	var url = "/meteorology/timeseries/"+idStation
	console.log(url)
	var request = new XMLHttpRequest()
	request.addEventListener('load',processTimeSeries)
	request.open("GET",url)
	request.send()

}

window.addEventListener('load',initialize);
