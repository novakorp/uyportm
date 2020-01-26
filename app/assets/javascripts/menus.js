


// IMPORTANTE
// Esta funcion debe definirse en cada pagina donde se usa un menu 
// para realizar el procesamiento correspondiente a cada una.
//
// Procesa una accion de menu. 
// Recibe un id de parametro (del objeto sobre el que se aplica el menu) 
// y el id del item de menu seleccionado.
//function procesarAccionMenu (menuId, menuItemId, paramId) {
//   alert ('paramId = ' + paramId + ' , menuId = ' + menuItemId );
//}



// Prepara un menu generico para procesar acciones sobre un elemento particular.
// Recibe un id de parametro que es usado al procesar las acciones del menu.
function prepararMenu (menuId, paramId) {
   $( "#" + menuId ).menu( {
   
      // define funcion a invocar al cliquear un item del menu
      select: function( event, ui ) {  

          // Al cliquear un elemento ocultar el menu
          $( "#" + menuId).css("display","none");
            
          // Invocar funcion de procesamiento de acciones, pasando el id del item del menu seleccionado
          // y el id de parametro 
          procesarAccionMenu (menuId, ui.item[0].attributes["id"].value, paramId );
        } 
    });
} 


// Despliega un menu para un objeto asociado a un id.
// Recibe el id del menu a desplegar, el id del elemento que invoca el menu (el boton)
// y el id del objeto para el que se invoca el menu.
function desplegarMenuObjeto(menuId, InvElementId, paramId) {
  
  // Preparar el elemento 
  prepararMenu(menuId, paramId) ;

  // get effect type from
  var selectedEffect = "blind";

  // most effect types need no options passed by default
  var options = {};     

  // Position the menu       
  $( "#toggler_" + menuId ).position({
    my: "right top+3",
    at: "right bottom",
    of: "#" + InvElementId
  });  

  // run the effect
  $( "#" + menuId ).toggle( selectedEffect, options, 100 );
}

    