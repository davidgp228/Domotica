<%-- 
    Document   : Habitaciones
    Created on : 27-jul-2018, 17:57:40
    Author     : mac
--%>

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
        
        <input type="hidden" name="consulta" id="idconsulta" value="insertarHabitacion">
        
        <div  class="container" style="margin-top:50px">
            <center><font id="idtitulo" size="5" color="#0033cc">Agregar</font></center> 
        </div>
        
        <div id="idseleccionarhabitacion" name="_seleccionarhabitacion" style="display:none;">
            
            
            <table class="table">
                <tr>
                    <td>
                         <center> <font size="3" color="#0033cc">Seleccionar habitacion</font> </center>
                    </td>
                    <td>
                        <select class="form-control">
                            <option>Seleccionar</option>
                        </select>
                    </td>
                </tr>
            </table>
            
        </div>
        
        <div class="container">
            
             <center><font size="4" >Datos de la habitaciòn</font></center>
            
            <table class="table">
                <tr>
                    <td>
                        <center><font size="3" >Nombre: </font></center>
                    </td>
                    <td>
                        <input id="idnombre" class="form-control">
                    </td>
                </tr>
                 <tr>
                     <td>
                         <center><font size="3" >Imagen: </font></center>
                     </td> 
                    <td height="130" colspan="2">
                        <center>
                            <center> <img id="imgSalida" width="120" height="120" src="images/addimage.png"  /></center>
                              <br>
                              <input class="form-control" accept="image/*" name="file-input" id="file-input" type="file" />
                              <font size="2" >[ Max: 16 MB ]</font>
                        </center>
                    </td>
                </tr>
              
                
            </table>   
                           
        </div>
        
        <br>
        <div id="idbotones">
            <center>
                <button id="idguargar" onclick="insertar()" class="btn btn-primary">GUARDAR</button>
                <button id="ideditar"   class="btn btn-primary" style="display: none">GUARDAR CAMBIOS</button>
                <button id="ideliminar" class="btn btn-danger"  style="display: none">ELIMINAR</button>
            </center>
        </div>
        
    </body>
</html>
