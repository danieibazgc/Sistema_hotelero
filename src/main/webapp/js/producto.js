function llenarFormulario(fila){
    var codigo = $(fila).find(".codigo").text();
    var nombre = $(fila).find(".nombre").text();
    var precio = $(fila).find(".precio").text();
    var stock = $(fila).find(".stock").text();
    var descripcion = $(fila).data("descripcion");
    var tipo = $(fila).data("tipo");
    var estado = $(fila).data("estado");
    var codproducto = $(fila).data("codigoproducto");
    
    $("#txtproductoId").val(codigo);
    $("#txtNombreProducto").val(nombre);
    $("#txtPrecio").val(precio); 
    $("#txtStock").val(stock);
    $("#txtDescripcion").val(descripcion);
    $("#txtTipoProducto").val(tipo);
    $("#txtEstado").val(estado);
    $("#txtCodigoProducto").val(codproducto);
}


$(document).ready(function(){
    // Inicializa DataTables
    $('#mydataTable').DataTable();
    
    // Resetea el formulario cuando se cierra el modal
    $("#exampleModal").on("hidden.bs.modal", function(){
        $('form')[0].reset();
        $("#txtStock").val('');  // Limpia el campo de password si es un input de texto
    });
    
    // Llenar formulario para editar
    $(document).on('click', '.btnEditar', function(){
        llenarFormulario($(this).closest('tr'));
//        $('.btnOcultar1').attr('disabled', 'disabled');
//        $('.btnOcultar').removeAttr('disabled');
        $('.btnGuardarModal').hide();
        $('.btnEditarModal').show();
        $('.btnEliminarModal').hide();
        $('.btnCancelarModal').hide();
    });

    // Llenar formulario para eliminar
    $(document).on('click', '.btnEliminar', function(){
        llenarFormulario($(this).closest('tr'));
//        $('.btnOcultar1').attr('disabled', 'disabled');
//        $('.btnOcultar').removeAttr('disabled');
        $('.btnGuardarModal').hide();
        $('.btnEditarModal').hide();
        $('.btnEliminarModal').show();
        $('.btnCancelarModal').hide();
    });

    // Preparar formulario para agregar nuevo usuario
    $(document).on('click', '.btnAdd', function(){
//        $('.btnOcultar').attr('disabled', 'disabled');
//        $('.btnOcultar1').removeAttr('disabled');
        $('.btnGuardarModal').show();
        $('.btnEditarModal').hide();
        $('.btnEliminarModal').hide();
        $('.btnCancelarModal').hide();
    });
});


function generarPDF() {
    // Crear un objeto XMLHttpRequest
    var xhr = new XMLHttpRequest();

    // Definir la función que manejará la respuesta del servidor
    xhr.onload = function () {
        if (xhr.status == 200) {
            // Convertir la respuesta del servidor (PDF) en un objeto Blob
            var blob = new Blob([xhr.response], {type: 'application/pdf'});

            // Crear un enlace <a> en el documento
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);

            // Asignar el nombre del archivo PDF
            link.download = 'producto.pdf';

            // Hacer clic en el enlace para iniciar la descarga del PDF
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el PDF.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/PDFs/ProductoPdf.jsp';

    // Abrir la conexión y enviar la solicitud al servidor para generar el PDF
    xhr.open("GET", url, true);
    xhr.responseType = 'arraybuffer'; // Especificar que la respuesta será un ArrayBuffer (para el PDF)
    xhr.send();
}


function generarExcel() {
    // Crear un objeto XMLHttpRequest
    var xhr = new XMLHttpRequest();

    // Definir la función que manejará la respuesta del servidor
    xhr.onload = function () {
        if (xhr.status == 200) {
            // Convertir la respuesta del servidor (Excel) en un objeto Blob
            var blob = new Blob([xhr.response], {type: 'application/vnd.ms-excel'});

            // Crear un enlace <a> en el documento
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);

            // Asignar el nombre del archivo Excel
            link.download = 'Producto.xls';

            // Hacer clic en el enlace para iniciar la descarga del Excel
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el Excel.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/Excels/ProductoExcel.jsp';

    // Abrir la conexión y enviar la solicitud al servidor para generar el Excel
    xhr.open("GET", url, true);
    xhr.responseType = 'arraybuffer'; // Especificar que la respuesta será un ArrayBuffer (para el Excel)
    xhr.send();
}