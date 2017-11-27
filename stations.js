
var containerStations = document.getElementById("listStations")
var containerMap = document.getElementById("map-canvas")
var map = null
var colors = ["#B40404","#08088A","#F7FE2E","#04B404","#B40486","#3B170B"]


function getColor(){
	var color = colors.shift();
	colors.push(color);
	return color;
}


function pinSymbol(color){
	return {
		path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z M -2,-30 a 2,2 0 1,1 4,0 2,2 0 1,1 -4,0',
		fillColor: color,
		fillOpacity: 1,
		strokeColor: '#000',
		strokeWeight: 2,
		scale: 1,
	};

}

function addMarker(station, color){
	latitude = station.latitude
	longitude = station.longitude
	var marker = new google.maps.Marker({
		map: map,
		position: new google.maps.LatLng(latitude, longitude),
		icon: pinSymbol(color)
	});
	marker.addListener('click', function(){
		var content = '<div><a href="station/'+station.pk  + '">' + station.name + '</a></div>';
		var infowindow = new google.maps.InfoWindow({content: content});
		infowindow.open(map,this);
	});

}

function renderStation(station){
	var li = document.createElement("li")
	var span = document.createElement("span")
	var a = document.createElement("a")	
	a.innerHTML = station.name
	a.href = "station/"+station.pk;
	span.appendChild(a)
	li.appendChild(span)
	var color = getColor()
	li.style.color = color;
	a.style.color = 'black'
	containerStations.appendChild(li)
	addMarker(station,color);
}

function processStations(event){
	var respond = event.target.responseText
	var stations = JSON.parse(respond)
	var i;
	for (i=0; i< stations.length; i++){		
		station = stations[i].fields;
		station.pk = stations[i].pk;
		renderStation(station);
	}	

}

function initialize(){
	// se pide la lista de estaciones
	var url = "/meteorology/stations"
	var request = new XMLHttpRequest()
	request.addEventListener('load',processStations)
	request.open("GET",url)
	request.send()
	// se inicializa el mapa
	map = new google.maps.Map(containerMap,{
		center:{lat:-1.619924,lng:-79.276271},
		scrollwheel: true,
		zoom: 7
	});

}

window.addEventListener('load',initialize);
