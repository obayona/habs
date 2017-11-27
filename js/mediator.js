
//Patron de disenio Mediator

var mediator = (function(){
  // Coleccion de topicos/eventos
  var channels = {};
  // Subscribir a un evento
  // Recibe el canal o topico, un callback, y el contexto
  var subscribe = function(channel, fn, context){
    if (!channels[channel]) channels[channel] = [];
    channels[channel].push({ context: context, callback: fn });
  };

  //Ejecuta todos los callbacks subscritos a un canal
  var publish = function(channel){
    if (!channels[channel]) return false;
    var args = Array.prototype.slice.call(arguments, 1);
    
    for (var i = 0, l = channels[channel].length; i < l; i++) {
      var subscription = channels[channel][i];
      subscription.callback.apply(subscription.context, args);
    }
  }

  return{
    subscribe:subscribe,
    publish:publish
  }


}());