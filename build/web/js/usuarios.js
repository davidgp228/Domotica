/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var ids=["#idhabitaciones","#iddispositivos","#idusuarios","#idcontrol"];


function agregarUsuarios(){
        $("#idtitulo").text("Agregar");
        $("#idseleccionarhabitacion").css("display","block");
        $("#idguargar").css("display","block");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","none");
}

function editarUsuarios(){
        $("#idtitulo").text("Editar");
        $("#idseleccionarusuario").css("display","block");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","block");
        $("#ideliminar").css("display","none");
}

function eliminarUsuarios(){
        $("#idtitulo").text("Eliminar");
        $("#idseleccionarusuario").css("display","block");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","block");
}

function permisoTodos(){
    
    if($('#idadministrador').is(":checked")){
        
        //** Desabilitar todos
        for(i=0;i<ids.length;i++ ){
            $( ids[i] ).prop( "disabled", true );
        }
        
        //** Seleccionar todos
        for(i=0;i<ids.length;i++ ){
            $( ids[i] ).prop( "checked","checked");
        }
        
    }
    else{
        
        for(i=0;i<ids.length;i++ ){
            $( ids[i] ).prop( "disabled", false );
        }
        
        
        for(i=0;i<ids.length;i++ ){
            $( ids[i] ).prop( "checked","");
        }
    }
}