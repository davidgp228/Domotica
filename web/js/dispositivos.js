/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function agregarDispositivo(){
        $("#idcambio").val("insertarDispositivo");
        $("#idseleccionardispositivo").css("display","none");
        $("#idtitulo").text("Agregar");
        $("#idguargar").css("display","block");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","none");
}

function editarDispositivo(){
        $("#idcambio").val("editarDispositivo");
        $("#idseleccionardispositivo").css("display","block");
        $("#idtitulo").text("Editar");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","block");
        $("#ideliminar").css("display","none");
}

function eliminarDispositivo(){
        $("#idcambio").val("eliminarDispositivo");
        $("#idseleccionardispositivo").css("display","block");
        $("#idtitulo").text("Eliminar");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","block");
}

function insertar(){
    
        if($("#idhabitacion").val()===""){
            alert("Seleccionar habitacion");
            return;
        }
        else if($("#idnombredispositivo").val()===""){
            alert("Asignar nombre al dispositivo");
            return;
            
        }
        else {
             $("#idhabitacionenviar").val($("#idhabitacion").val());
             $("#idagregar").submit();
        }
}

