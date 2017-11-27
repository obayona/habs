var plotter = (function(){

	var layout = {}


	var plot = function(container,data){

		var trace = {
			type: "scatter",
			mode: "lines",
			name: data.name,
			x: data.x,
			y: data.y,
			line: {color: '#17BECF'}
		}

		var traces = [trace];
		var layout = {
			title:data.name,
			
			xaxis: {
				autorange: true,
				rangeslider: {range: [ data.x[0], data.x[data.x.length-1] ]},
				type: 'date'
			},

			yaxis: {
				autorange: true,
				type: 'linear'
			}
		}
		Plotly.newPlot(container, traces, layout);
	}

	return {plot:plot};


}());