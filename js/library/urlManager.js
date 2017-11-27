// ProxyURL
// Modulo que se encarga de obtener las variables del url
// Actualizar el url
// agregar entradas en el historial del navegador

var ProxyURL = function(mediator){


  // getAllURLParams()
  // obtiene el url de la pagina
  // parsea el string y retorna un objeto con las variables
  var getAllUrlParams = function() {
    var url = document.URL;
    // get query string from url (optional) or window
    var queryString = url ? url.split('?')[1] : window.location.search.slice(1);

    // we'll store the parameters here
    var obj = {};

    // if query string exists
    if (queryString) {

      // stuff after # is not part of query string, so get rid of it
      queryString = queryString.split('#')[0];

      // split our query string into its component parts
      var arr = queryString.split('&');

      for (var i=0; i<arr.length; i++) {
        // separate the keys and the values
        var a = arr[i].split('=');

        // in case params look like: list[]=thing1&list[]=thing2
        var paramNum = undefined;
        var paramName = a[0].replace(/\[\d*\]/, function(v) {
          paramNum = v.slice(1,-1);
          return '';
        });

        // set parameter value (use 'true' if empty)
        var paramValue = typeof(a[1])==='undefined' ? true : a[1];

        // if parameter name already exists
        if (obj[paramName]) {
          // convert value to array (if still string)
          if (typeof obj[paramName] === 'string') {
            obj[paramName] = [obj[paramName]];
          }
          // if no array index number specified...
          if (typeof paramNum === 'undefined') {
            // put the value on the end of the array
            obj[paramName].push(paramValue);
          }
          // if array index number specified...
          else {
            // put the value at that index number
            obj[paramName][paramNum] = paramValue;
          }
        }
        // if param name doesn't exist yet, set it
        else {
          obj[paramName] = paramValue;
        }
      }
    }

    return obj;
  }


  // getData(variables)
  // analiza las variables resultantes de la llamada al metodo
  // getAllUrlParams
  // las variables obtenidas deben ser:
  // planta: de tipo entero
  // hoja: de tipo entero
  // e1: rutaExperimento1, de tipo string
  // e2: rutaExperimento2, de tipo string
  var getData = function(variables){
    var data = {}
    var planta = parseInt(variables.planta);
    //valida idPlanta
    if(Number.isInteger(planta))
      data["idPlanta"] = planta;
    else
      return {}; //si no tiene idPlanta no puede tener mas variables
    
    var hoja = parseInt(variables.hoja);
    if(Number.isInteger(hoja))
      data["numHoja"] = hoja;
    else
      return data; // si no hay hoja, no puede haber experimentos

    if(typeof variables.e1 == 'string')
        data["e1"] = decodeURI(variables.e1);
    if(typeof variables.e2 == 'string')
        data["e2"] = decodeURI(variables.e2);

    return data;
  }


  // getRoute(data)
  // crea un string adecuado para el fileManager
  // plantas/plantaX/hojaY/
  // recibe el objeto que retorna getData
  var getRoute = function(data){
    var route = "plantas";
    if(data.idPlanta!=undefined){
      route += "/Planta " + data.idPlanta;
    }
    if(data.numHoja!=undefined){
      route += "/Hoja " + data.numHoja;
    }
    return route;

  }

  // getFiles(data)
  // crea un arreglo de objetos que contiene a los files
  // [{"name":e1,"which":1},{"name":e2,"which":2}]
  var getFiles = function(data){
    var files = [];
    if( typeof data.e1 === "string" ){
      files.push({"name":data.e1, "which":1 });
    }
    if( typeof data.e2 == 'string' ){
      files.push({"name":data.e2, "which":2 });
    }
    return files;
  }


  // getDataFromRoue(route)
  // Dada un route generado por un FileManager
  // retorna las variables en un objeto
  var getDataFromRoute = function(route){
    var data = {};
    var route = route.split("/");
    var lengthRoute = route.length;
    if(lengthRoute>1){
      var planta = route[1];
      var idPlanta = planta.split(" ")[1];
      data.idPlanta = parseInt(idPlanta);
    }
    if(lengthRoute>2){
      var hoja = route[2];
      var numHoja = hoja.split(" ")[1];
      data.numHoja = parseInt(numHoja);
    }

    return data;
  }


  // getUrlFromData(data)
  // dado un objeto con las variables
  // crea el url
  var getUrlFromData = function(data){
      var url = "rip"
      if(data.idPlanta){
        var queryPlanta = "?planta="+data.idPlanta;
        url += queryPlanta;
      }
      if(data.numHoja){
        var queryHoja = "&hoja="+data.numHoja;
        url += queryHoja;
      }
      if(data.e1){
        var queryE1 = "&e1="+data.e1;
        url += queryE1;
      }
      if(data.e2){
        var queryE2 = "&e2="+data.e2;
        url += queryE2;
      }
      return url;      
  }



  this.init = function(){
    var variables = getAllUrlParams();
    var data = getData(variables);
    var route = getRoute(data);
    var selectedFiles = getFiles(data);
    mediator.publish("load",route,selectedFiles);


    mediator.subscribe("changeRoute", function(route){
        var data = getDataFromRoute(route);
        var url = getUrlFromData(data);
        var currentURL = document.URL;
        currentURL = currentURL.split("/").pop();
        if(url!=currentURL){
          window.history.pushState(data,"change-route",url); 
        }
        
    });

    mediator.subscribe("loadedFiles", function(files){
        var variables = getAllUrlParams();
        var data = getData(variables);
        for (var i=0; i<files.length; i++){
          var key = "e" + files[i]["which"];
          data[key] = files[i]["name"];
        }
        var url = getUrlFromData(data);
        window.history.pushState(data,"change-route",url); 

    });

  }
  

}