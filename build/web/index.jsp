<%-- 
    Document   : index
    Created on : 11-jun-2018, 18:08:12
    Author     : mac
--%>

<%@page import="control.Habitaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.Consultas" %>
<!DOCTYPE html>

    <% 
        HttpSession sesion=request.getSession();
        int userId;
        if(sesion==null){
            System.out.println("No ha iniciado sesion");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No ha iniciado sesion');");
            out.println("</script>");
            response.sendRedirect("Login.jsp");
            return;
        }
        else{
            if(sesion.getAttribute("userId")==null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El usuario no existe');");
                out.println("</script>");
                response.sendRedirect("Login.jsp");
                System.out.println("Sesion userId no existe");
                return;
            }
            userId=Integer.parseInt(sesion.getAttribute("userId").toString());
            if(userId==-1){
                 System.out.println("sesion2");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Inicio de sesion invalida');");
                out.println("</script>");
                response.sendRedirect("Login.jsp");
                return ;
            }
        }
        
    String []datosHabitacion=null;
    String habitacion=Consultas.getAttrib(request, "_buscarhabitacion");
    String cambio=Consultas.getAttrib(request, "cambio");
   
    System.out.println("Cambio "+cambio);
    
    if(!habitacion.equals("")){
        datosHabitacion= Habitaciones.obtenerHabitacion(habitacion);
    }
    
        //** Limpiar cache para validar login
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        if(sesion.getAttribute("userId")==null){
            response.sendRedirect(request.getContextPath() + "/Login.jsp");

        }
    %>
    
       
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Import jquery-->
        <script src="js/jquery.js"></script>
        
           <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
          <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">       
        
        <!-- Import the javascript of this class -->
        <script src="js/bootstrap.min.js"></script> <!-- No is type javascript text -->
        <script type="text/javascript" src="js/Habitaciones.js"></script>
        
    </head>
    <body >
        <%=Consultas.menuhabitaciones%>
        
        <div  class="container" style="margin-top:50px">
                <center><font id="idtitulo" size="5" color="#0033cc">Agregar</font></center> 
        </div>
        
        <form action="index.jsp" method="POST" id="idseleccionarhabitacion" name="_seleccionarhabitacion" style="display:none;">
                            
                <input type="hidden" name="cambio" id="idcambio" value="insertarHabitacion">
                
                <table class="table">
                    <tr>
                        <td>
                             <center> <font size="3" color="#0033cc">Seleccionar habitacion</font> </center>
                        </td>
                        <td>
                            <select onchange="this.form.submit()" id="idbuscarhabitacion" name="_buscarhabitacion" class="form-control">
                                <option value="">Seleccionar</option>
                                <% 
                                String idSeleccionado= datosHabitacion==null?"":datosHabitacion[0];    
                                String habitaciones =Habitaciones.nombreHabitaciones(idSeleccionado); 
                                %>
                                <%=habitaciones%>
                            </select>
                        </td>
                    </tr>
                </table>
                            
        </form>    
        
        
        <form id="form" method="POST" action="Habitaciones" class="container">
        
                <%String imagen=datosHabitacion==null?"images/addimage.png":datosHabitacion[2];%>
                <input type="hidden" name="accion" id="idaccion" value="insertarHabitacion">
                <input id="idimagen" name="_imagen" type="hidden" value="<%=imagen%>" > <!-- El valor de la imagen-->
                <input id="idhabitacionenviar" name="_idhabitacion" type="hidden">

                <center><font size="4" >Datos de la habitaciòn</font></center>

                <table class="table">
                    <tr>
                        <td>
                            <center><font size="3" >Nombre: </font></center>
                        </td>
                        <td>
                            <input id="idnombre" value="<%=datosHabitacion==null?"":datosHabitacion[1]%>" name="_nombre" class="form-control">
                        </td>
                    </tr>
                     <tr>
                         <td>
                             <center><font size="3" >Imagen: </font></center>
                         </td> 
                        <td height="130" colspan="2">
                            <center>
                                <center> <img id="imgSalida" width="120" height="120" src="<%=imagen%>"  /></center>
                                  <br>
                                  <input class="form-control" accept="image/*" name="file-input" id="file-input" type="file" />
                                  <font size="2" >[ Max: 16 MB ]</font>
                            </center>
                        </td>
                    </tr>

                </table>   

        </form>       
                                  
      <!-- <p>Capture Image: <input type="file" accept="image/*" id="capture" capture="camera"> -->
                                  
        <br>
        <div id="idbotones">
            <center>
                <button id="idguargar"  onclick="insertar()"  class="btn btn-primary">GUARDAR</button>
                <button id="ideditar"   onclick="editar()" class="btn btn-primary" style="display: none">GUARDAR CAMBIOS</button>
                <button id="ideliminar" onclick="eliminar()" class="btn btn-danger"  style="display: none">ELIMINAR</button>
            </center>
        </div>
        
         <%if(cambio.equals("editarHabitacion")){%> 
                    <script>
                        editarHabitacion();
                    </script>
         <%}
         else if(cambio.equals("eliminarHabitacion")){ %>
                    <script>
                        eliminarHabitacion();
                    </script>
        <%}%>
        
    </body>
</html>
