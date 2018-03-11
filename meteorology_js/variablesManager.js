
var VariablesManager = function(idContainerList, idContainerVariable){

	var containerList = null;
	var containerVariable = null;
	var variables = []


	var loadData = function(idStation){

		var url = "/meteorology/variables/" + idStation;		
		var request = $.get(url);
		// evento done
		request.done(function(data){
			variables = data.variables;
			console.log("***variables", variables);
			render();
		});
		// evento fail
		request.fail(function(){
			renderMessage("Error");
		});

	}


	var findVariable = function(idVariable){
		var i, numVariables;
		numVariables = variables.length;
		for (i=0; i< numVariables; i++){
			var pk = variables[i].pk;
			if(pk == idVariable)
				return variables[i];
		}

	}

	var renderVariable = function(variable){
		var divName = document.createElement("div");
		var divDescription = document.createElement("div");
		var divUnit = document.createElement("div");

		divName.innerHTML = "<b>"+variable.name+"</b>";
		divDescription.innerHTML = "<p>" + variable.description + "</p>";
		var unitString = "";
		var unit = variable.unit;
		unitString = unit.description + " (" + unit.representation + ")"
		divUnit.innerHTML = "<p>" + unitString + "</p>"

		containerVariable.innerHTML = "";
		containerVariable.appendChild(divName);
		containerVariable.appendChild(divDescription);
		containerVariable.appendChild(divUnit); 

	}

	var renderMessage = function(msg){
		containerList.innerHTML = "";
		var h4 = document.createElement("h4");
		h4.innerHTML = msg;
		containerList.appendChild(h4);
	}

	var selectItem = function(pk){
		var list = containerList.childNodes;
		console.log(list);
		for (var i=0; i< list.length; i++){
			var idVariable = list[i].dataset["idVariable"];
			console.log("ooooooooo",idVariable,pk);
			if(idVariable==pk){
				list[i].className = "list-group-item selected";
			}
			else{
				list[i].className = "list-group-item";
			}
		}


	}

	var render = function(){

		var i, numVariables;
		numVariables = variables.length;
		if(numVariables==0){
			renderMessage("No data");
			return;
		}
		
		ul = document.createElement("ul");
		ul.className = "nav";

		for (i=0; i< numVariables; i++){
			var v = variables[i];
			var li = document.createElement("li");
			var item = document.createElement("a");
			li.appendChild(item);
			item.innerHTML = v.name;
			item.dataset.idVariable = v.pk;

			item.addEventListener("click",function(event){
				var pk = this.dataset.idVariable;
				var variable = findVariable(pk);
				//selectItem(pk);
				mediator.publish("loadVariable",variable);
				renderVariable(variable);
			})
			ul.append(li);
		}
		containerList.append(ul);

	}

	this.init = function(idStation){
		containerList = document.getElementById(idContainerList);
		containerVariable = document.getElementById(idContainerVariable)
		if(!containerList){
			console.log("Error");
			return;
		}
		if(!containerVariable){
			console.log("Error");
			return;
		}
		loadData(idStation);
	}

}
