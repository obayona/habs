
function main(event){
  


  var variablesManager = new VariablesManager("variablesList","variableDetails");
  variablesManager.init(1);

  var timeSeriesManager = new TimeSeriesManager("timeSeries");
  timeSeriesManager.init();

}



window.addEventListener('load', main);
