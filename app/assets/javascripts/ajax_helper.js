
/* Funciones generales para acceso a funcionalidades de Ajax con jquery */

jQuery.ajaxSetup({
  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") ;}
});

$.fn.subSelectWithAjax = function(url_action, elem_id) {
  var that = this;
   
  this.change(function() {
    $.post(url_action, {id: that.val(), element_id: elem_id}, null , "script");
  });
};
