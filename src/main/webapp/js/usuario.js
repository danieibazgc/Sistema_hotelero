function llenarFormulario(fila){
    var codigo = $(fila).find(".codigo").text();
    var username = $(fila).find(".username").text();
    var email = $(fila).find(".email").text();
    var password = $(fila).find(".password").text();
    
    $("#txtCodigo").val(codigo);
    $("#txtusername").val(username);
    $("#txtemail").val(email); 
    // Si txtpassword es un input de texto, usa val() para establecer su valor
    $("#txtpassword").val(password);
}

$(document).ready(function(){
    // Inicializa DataTables
    $('#mydataTable').DataTable();
    
    // Resetea el formulario cuando se cierra el modal
    $("#exampleModal").on("hidden.bs.modal", function(){
        $('form')[0].reset();
        $("#txtpassword").val('');  // Limpia el campo de password si es un input de texto
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

