function llenarFormulario(fila) {
    var idAlojamiento = $(fila).find(".IdAlojamiento").text();
    var codhabitacion = $(fila).find(".codigohabitacion").text(); //COMBOBOX
    var Ndocumento = $(fila).find(".Ndocumento").text(); //COMBOBOX
    var FechaEntrada = $(fila).find(".FechaEntrada").text();
    var FechaSalida = $(fila).find(".FechaSalida").text();
    var PagoAdelanto = $(fila).data("pagoadelanto");
    var PrecioTotal = $(fila).data("preciototal");
    var EstadoHabitacion = $(fila).data("estado"); //COMBOBOX
    var PrecioHabitacion = $(fila).data("preciodehabitacion");

    $("#txtidRAalojamiento").val(idAlojamiento);
    $("#txtFechaEntrada").val(FechaEntrada);
    $("#txtFechaSalida").val(FechaSalida);
    $("#txtPagoAdelanto").val(PagoAdelanto);
    $("#txtPrecioTotal").val(PrecioTotal);
    $("#txtPrecioHabitacion").val(PrecioHabitacion);

    $("#txtidCodigohabitacion option[selected]").removeAttr('selected');
    $("#txtidCodigohabitacion option:contains(" + codhabitacion + ")").attr('selected', true);

    $("#txtidCliente option[selected]").removeAttr('selected');
    $("#txtidCliente option:contains(" + Ndocumento + ")").attr('selected', true);

    $("#txtEstadoHabitacion option[selected]").removeAttr('selected');
    $("#txtEstadoHabitacion option:contains(" + EstadoHabitacion + ")").attr('selected', true);
}


$(document).ready(function () {
    $('#mydataTable').DataTable();

    $("#exampleModal").on("hidden.bs.modal", function () {
        $('form')[0].reset();
        $("#txtidCodigohabitacion option[selected]").removeAttr('selected');
        $("#txtidCliente option[selected]").removeAttr('selected');
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



// SIRVE PARA OBTENER EN EL INPUT PRECIO DE HABITACION AL MOMENTO DE SELECCIONAR UN CODIGO DE HABITACION
function updatePrice() {
    var selectElement = document.getElementById("txtidCodigohabitacion");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var price = selectedOption.getAttribute("data-preciohabitacion");
    document.getElementById("txtPrecioHabitacion").value = price;
}


function updateTotal() {
    var priceInput = document.getElementById("txtPrecioHabitacion");
    var adelantoInput = document.getElementById("txtPagoAdelanto");
    var totalInput = document.getElementById("txtPrecioTotal");

    var price = parseFloat(priceInput.value);
    var adelanto = parseFloat(adelantoInput.value);

    if (!isNaN(price) && !isNaN(adelanto)) {
        var total = price - adelanto;
        totalInput.value = total.toFixed(2); // Redondeamos a 2 decimales
    } else {
        totalInput.value = ""; // Si no se puede calcular, dejamos el campo vacío
    }
}
