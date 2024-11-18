function llenarFormulario(fila) {
    var idhabitacion = $(fila).find(".IdHabitacion").text();
    var piso = $(fila).find(".piso").text(); //COMBOBOX
    var codhabitacion = $(fila).find(".codigohabitacion").text(); //COMBOBOX
    var precio = $(fila).find(".precio").text();
    var descripcion = $(fila).data("descripcion");
    var EstadoHabitacion = $(fila).find(".estado").text(); //COMBOBOX

    $("#txtidHabitacion").val(idhabitacion);
    $("#txtNombre").val(precio);
    $("#txtdescripcionHabitacion").val(descripcion);
    $("#txtEstadoHabitacion").val(EstadoHabitacion);

    $("#txtidPisoHabitacion option[selected]").removeAttr('selected');
    $("#txtidPisoHabitacion option:contains(" + piso + ")").attr('selected', true);

    $("#txtidCategoriaHabitacion option[selected]").removeAttr('selected');
    $("#txtidCategoriaHabitacion option:contains(" + codhabitacion + ")").attr('selected', true);


    $("#txtEstadoHabitacion option[selected]").removeAttr('selected');
    $("#txtEstadoHabitacion option:contains(" + EstadoHabitacion + ")").attr('selected', true);



}

$(document).ready(function () {
    $('#mydataTable').DataTable();

    $("#exampleModal").on("hidden.bs.modal", function () {
        $('form')[0].reset();
        $("#txtidPisoHabitacion option[selected]").removeAttr('selected');
        $("#txtidCategoriaHabitacion option[selected]").removeAttr('selected');
        $("#txtEstadoHabitacion option[selected]").removeAttr('selected');
    });

    $(document).on('click', '.btnEditar', function () {
        llenarFormulario($(this).closest('tr'));
//        $('.btnOcultar1').attr('disabled', 'disabled');
//        $('.btnOcultar').removeAttr('disabled');
        $('.btnGuardarModal').hide();
        $('.btnEditarModal').show();
        $('.btnEliminarModal').hide();
        $('.btnCancelarModal').hide();
    });
    $(document).on('click', '.btnEliminar', function () {
        llenarFormulario($(this).closest('tr'));
//        $('.btnOcultar1').attr('disabled', 'disabled');
//        $('.btnOcultar').removeAttr('disabled');
        $('.btnGuardarModal').hide();
        $('.btnEditarModal').hide();
        $('.btnEliminarModal').show();
        $('.btnCancelarModal').hide();
    });
    $(document).on('click', '.btnAdd', function () {
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
            link.download = 'habitacion.pdf';

            // Hacer clic en el enlace para iniciar la descarga del PDF
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el PDF.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/PDFs/HabitacionGeneralPdf.jsp';

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
            link.download = 'Habitacion.xls';

            // Hacer clic en el enlace para iniciar la descarga del Excel
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el Excel.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/Excels/HabitacionGeneralExcel.jsp';

    // Abrir la conexión y enviar la solicitud al servidor para generar el Excel
    xhr.open("GET", url, true);
    xhr.responseType = 'arraybuffer'; // Especificar que la respuesta será un ArrayBuffer (para el Excel)
    xhr.send();
}

function generarDisponiblePDF() {
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
            link.download = 'habitacionDisponible.pdf';

            // Hacer clic en el enlace para iniciar la descarga del PDF
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el PDF.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/PDFs/HabitacionDisponiblePdf.jsp';

    // Abrir la conexión y enviar la solicitud al servidor para generar el PDF
    xhr.open("GET", url, true);
    xhr.responseType = 'arraybuffer'; // Especificar que la respuesta será un ArrayBuffer (para el PDF)
    xhr.send();
}



function generarDisponibleExcel() {
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
            link.download = 'HabitacionDisponible.xls';

            // Hacer clic en el enlace para iniciar la descarga del Excel
            link.click();

            // Limpiar la URL del objeto Blob creado
            window.URL.revokeObjectURL(link.href);
        } else {
            alert("Error al generar el Excel.");
        }
    };

    // Construir la URL para la solicitud al servidor
    var url = contextPath + '/Excels/HabitacionDisponibleExcel.jsp';

    // Abrir la conexión y enviar la solicitud al servidor para generar el Excel
    xhr.open("GET", url, true);
    xhr.responseType = 'arraybuffer'; // Especificar que la respuesta será un ArrayBuffer (para el Excel)
    xhr.send();
}