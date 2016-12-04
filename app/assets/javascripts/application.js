// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap-select


$(document).ready(function() {
	$('.datatable').DataTable({
		"dom": '<"top"i>rt<"bottom"flp><"clear">',
		/*httpsÑ--datatables.net-examples-basic?init-dom.html*/

		"order": [[ 0, "desc" ]],
        "language": {
            "decimal":        "",
            "emptyTable":     "No hay datos disponibles",
            "info":           "Mostrando del _START_ al _END_ de _TOTAL_ resultados",
            "infoEmpty":      "Mostrando 0 a 0 de 0 entradas",
            "infoFiltered":   "(filtrado de _MAX_ resultados)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "Mostrar _MENU_ resultados",
            "loadingRecords": "Cargando...",
            "processing":     "Procesando...",
            "search":         "Buscar:",
            "zeroRecords":    "No se encontraron resultados",
            "paginate": {
                "first":      "Primero",
                "last":       "Último",
                "next":       "Siguiente",
                "previous":   "Anterior"
            }
        }
    });
    $('select').selectpicker();
});

//= require turbolinks

