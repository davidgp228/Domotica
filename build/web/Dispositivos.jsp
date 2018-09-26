<%-- 
    Document   : Dispositivos
    Created on : 30-jul-2018, 11:26:02
    Author     : mac
--%>

<%@page import="control.Dispositivos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.Consultas" %>
<%@page import="control.Habitaciones"%>
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
        <script type="text/javascript" src="js/dispositivos.js"></script>
        
    </head>
    <body >
        <%=Consultas.menudispositivos%>
       
        
        <form action="Dispositivos.jsp" class="container" style="margin-top:50px" method="POST" id="idseleccionarhabitacion" name="_seleccionarhabitacion">
            
             <input type="hidden" name="cambio" id="idcambio" value="insertarDispositivo">
             <center><font id="idtitulo" size="5" color="#0033cc">Agregar</font></center> 
            
            <table class="table">
                <tr>
                    <td>
                         <center> <font size="3" color="#0033cc">Seleccionar habitacion: </font> </center>
                    </td>
                    <td>
                        <select id="idhabitacion" onchange="this.form.submit()" name="_buscarhabitacion" class="form-control">
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
        
        <div id="idseleccionardispositivo" class="container" style="display: none">
            
            <table class="table">
                <tr>
                    <td>
                         <center> <font size="3" color="#0033cc">Seleccionar dispositivo: </font> </center>
                    </td>
                    <td>
                        <select class="form-control">
                            <option value="">Seleccionar</option>
                            <% 
                                String dispositivos =Dispositivos.obtenerDispositivos("", idSeleccionado); 
                            %>
                           <%=dispositivos%>
                        </select>
                    </td>
                </tr>
            </table>
            
        </div>
        
        <form id="idagregar" action="Dispositivos" method="POST" class="container">
            
            <input type="hidden" name="accion" id="idaccion" value="insertarDispositivo">
            <input id="idhabitacionenviar" name="_idhabitacion" type="hidden">
                                    
            <center><font size="4" >Datos del dispositivo</font></center>
            
            <table class="table">
                <tr>
                    <td>
                        <center><font size="3" >Nombre: </font></center>
                    </td>
                    <td>
                        <input id="idnombredispositivo" name="_nombre" class="form-control">
                    </td>
                </tr>
                <tr>
                    <td>
                        <center><font size="3" >Tipo: </font></center>
                    </td>
                    <td>
                        <select id="idtipodispositivo" name="_tipo" class="form-control">
                            <option>Foco</option>
                            <option>Plug</option>
                            <option>Ventilador</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center><font size="3" >ID unico: </font></center>
                    </td>
                    <td>
                        <input id="idunico" name="_idunico" class="form-control">
                    </td>
                </tr>
            </table>   
                           
        </form>
        
        <br>
        <div id="idbotones">
            <center>
                <button id="idguargar"  onclick="insertar()" class="btn btn-primary">GUARDAR</button>
                <button id="ideditar"   class="btn btn-primary" style="display: none">GUARDAR CAMBIOS</button>
                <button id="ideliminar" class="btn btn-danger"  style="display: none">ELIMINAR</button>
            </center>
        </div>
        
        <%if(cambio.equals("editarDispositivo")){%> 
                    <script>
                        editarDispositivo();
                    </script>
         <%}
         else if(cambio.equals("eliminarDispositivo")){ %>
                    <script>
                        eliminarDispositivo();
                    </script>
        <%}%>
        
    </body>
</html>