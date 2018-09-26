/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    var result="";
     
    function agregarHabitacion()
    {
        $("#idtitulo").text("Agregar");
        $("#idaccion").val("insertarHabitacion");
        $("#idcambio").val("insertarHabitacion");
        $("#idseleccionarhabitacion").css("display","none");
        $("#idguargar").css("display","block");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","none");
    }

    function editarHabitacion()
    {
        $("#idtitulo").text("Editar");
        $("#idaccion").val("editarHabitacion");
        $("#idcambio").val("editarHabitacion");
        $("#idseleccionarhabitacion").css("display","block");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","block");
        $("#ideliminar").css("display","none");       
    }
    
    function eliminarHabitacion(){
        $("#idtitulo").text("Eliminar");
        $("#idaccion").val("eliminarHabitacion");
        $("#idcambio").val("eliminarHabitacion");
        $("#idseleccionarhabitacion").css("display","block");
        $("#idguargar").css("display","none");
        $("#ideditar").css("display","none");
        $("#ideliminar").css("display","block");
    }
    
    function insertar(){
        if(result===""){
            alert("No se ha seleccionado ninguna imagen");
            return;
        }
        else if($("#idnombre").val()===""){
             alert("Asignar nombre a la habitacion");
            return;
        }
        else {
             $("#idimagen").val(result);
             $("#form").submit();
        }
      
    }
    
    function editar(){
        
        if($("#idbuscarhabitacion").val()===""){
            alert("No se ha seleccionado habitacion");
            return;
        }
        else if($("#idnombre").val()===""){
             alert("Asignar nombre a la habitacion");
            return;
        }
        else {
            
            if(result !== ""){
               $("#idimagen").val(result);
           }
            
            var confirmar= confirm("¿Lo datos son correctos?");
            
            if(confirmar)
            {
             $("#idhabitacionenviar").val($("#idbuscarhabitacion").val());
             $("#form").submit();
            }
        }
    }
    
    function eliminar(){
        
        if($("#idbuscarhabitacion").val()==="")
        {
            alert("No se ha seleccionado habitacion");
            return;
        }
        else if($("#idnombre").val()==="")
        {
             alert("Asignar nombre a la habitacion");
            return;
        }
        else {
            
            var confirmar = confirm("¿Realmente desea eliminar esta habitacion?");
            
            if(confirmar)
            {
             $("#idhabitacionenviar").val($("#idbuscarhabitacion").val());
             $("#form").submit();
            }
        }
        
    }
      
    $(window).load(function(){

     $(function() {
      $('#file-input').change(function(e) {
          addImage(e); 
         });

         function addImage(e){
            var file = e.target.files[0],
            imageType = /image.*/;

            if (!file.type.match(imageType))
             return;

            var reader = new FileReader();
            reader.onload = fileOnload;
            reader.readAsDataURL(file);
         }

         function fileOnload(e) {
            result=e.target.result;
           // $("#lbltext").text(result);
            $('#imgSalida').attr("src",result);
         }

        });
      });