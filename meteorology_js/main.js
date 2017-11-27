
function main(event){
  


  var variablesManager = new VariablesManager("variablesList","variableDetails");
  variablesManager.init(id_station);

  var timeSeriesManager = new TimeSeriesManager("timeSeries");
  timeSeriesManager.init();

}



window.addEventListener('load', main);
