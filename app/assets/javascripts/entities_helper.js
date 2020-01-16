

function list_delete_resource_dialog (resource_url, item_id) {
  
  // comando a ejecutar si se acepta el dialogo
  var strCommand = "list_delete_resource('" + resource_url + "', '"+ item_id + "') ";  
  $("#generic_popup_data").val(strCommand);
  
  // Titulo , contenido y accion
  $("#generic_popup_title").html('Eliminar');  
  $("#generic_popup_content").html('¿Está seguro?');
  $("#generic_popup_accept_caption").html('Aceptar');
  
  $("#show_generic_popup").click();
}


function list_delete_resource (resource_url, item_id) {
  
   delete_resource_ajax (resource_url, item_id);
}


function delete_resource_ajax (delete_url , item_id ) {
  var token_value = $("meta[name='csrf-token']").attr("content");
       
  
  $("#generic_popup").popup('close');
  
  $.ajax({
     url: delete_url,     
     headers: {'X-CSRF-token': token_value },
     type: 'DELETE',
     dataType: 'json',
     success: function(response) { 
        $("#" + item_id).hide();
      }
  }); 
}


