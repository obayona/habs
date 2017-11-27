
var TimeSeriesManager = function(idContainer){

	var container = null;
	var variable = null;
	var timeSeries = []

	var PLOT_HEIGHT = "500px";
	var PLOT_WIDTH = "100%"; 

	var loadData = function(){

		var url = "/meteorology/timeseries/" + variable.pk;		
		var request = $.get(url);
		// evento done
		request.done(function(data){
			timeSeries = data.timeSeries;
			console.log("***timeSeries", timeSeries);
			render();
		});
		request.progress(function(){
			//PROVISIONAL
			renderMessage("Cargando...");
		});
		// evento fail
		request.fail(function(){
			renderMessage("Error");
		});

	}


	var renderMessage = function(msg){
		container.innerHTML = "";
		var h4 = document.createElement("h4");
		h4.innerHTML = msg;
		container.appendChild(h4);
	}


	var createLoader = function(){
		var wrap_loader = document.createElement("div");
		var loader = document.createElement("div");
		wrap_loader.style.height = PLOT_HEIGHT;
		wrap_loader.style.width = container.width;
		wrap_loader.className = "wrapLoader";
		loader.className = "loader";
		wrap_loader.appendChild(loader);
		return wrap_loader;
	}


	var renderPlot = function(timeSerie){
		
		var plotContainer = document.createElement("div");
		plotContainer.style.height = PLOT_HEIGHT;
		plotContainer.style.width = PLOT_WIDTH;
		plotContainer.style.margin = "10px";
		var loader = createLoader();
		plotContainer.appendChild(loader);

		container.appendChild(plotContainer);


		// get data of the time series
		var url = "/meteorology/entries/"+timeSerie.pk;
		console.log(url);
		var request = $.get(url);

		request.done(function(data){
			entries = data.entries;
			entries.name = timeSerie.name;
			plotContainer.innerHTML = "";
			console.log("***entries", entries);
			plotter.plot(plotContainer,entries);		
		});
		request.progress(function(){
			
		});
		// evento fail
		request.fail(function(){
			renderMessage("Error");
		});
		
	}



	var render = function(){
		var i, num;
		num = timeSeries.length;

		while(container.firstChild){
			console.log(container.firstChild);
		    container.removeChild(container.firstChild);
		}


		if(num==0){
			renderMessage("No hay datos");
			return;
		}

		for (i=0; i< num; i++){
			var timeSerie = timeSeries[i];
			renderPlot(timeSerie);
		}

	}

	this.init = function(){
		container = document.getElementById(idContainer);
		if(!container){
			console.log("Error");
		}
		// subscribir a un evento
		mediator.subscribe("loadVariable",function(v){
			variable = v;
			loadData();
		});
		renderMessage("Seleccione una variable");

		
	}

}