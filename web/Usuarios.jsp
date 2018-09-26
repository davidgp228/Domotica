<%-- 
    Document   : Usuarios
    Created on : 28-jul-2018, 10:10:03
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.Consultas"%>
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
        
        <script type="text/javascript" src="js/usuarios.js"></script>
    </head>
    
    <body >
        
        <%=Consultas.menuusuarios%>
        
        <div class="container" style="margin-top:50px">
            <center><font id="idtitulo" size="5" color="#0033cc">Agregar</font></center>
        </div>
        
        <div id="idseleccionarusuario" name="_seleccionarusuario" style="display:none;">
            
            
            <table class="table">
                <tr>
                    <td>
                         <center> <font size="3" color="#0033cc">Seleccionar usuario</font> </center>
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
                        
            <center><font size="4" >Datos del usuario</font></center>
            
            <table class="table">
                <tr>
                    <td>
                        <center><font size="3" >Nombre: </font></center>
                    </td>
                    <td>
                        <center><font size="3" >Usuario: </font></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control" >
                    </td>
                    <td>
                        <input class="form-control" >
                    </td>
                </tr>
                  <tr>
                   <td>
                       <center><font size="3" >Contraseña:</font></center> 
                   </td>
                   <td>
                       <center><font size="3" >Confirmar contraseña</font></center> 
                   </td>
               </tr>
               <tr>
                   <td>
                       <input id="idnuevacontrasena" name="_nuevacontrasena" required class="form-control" type="password" >
                   </td>
                   <td>
                       <input id="idconfirmarcontrasena" name="_confirmarcontrasena" required class="form-control" type="password">
                   </td>
               </tr>
            </table>
            
            
             <center><font size="4" >Asignar permisos</font></center> 
             
                <table class="table table-bordered">
                <thead class="alert alert-info">
                 <tr>
                  <th>Permisos</th>
                  <th>Permitir/Denegar</th>
                  </tr>
                </thead>
                <tr>
                  <td><font size="3" >Administrador</font></td>
                  <td><input id="idadministrador" value="administrador" type="checkbox" onchange="permisoTodos()" class="form-control"></td>
               </tr>
               <tr>
                  <td><font size="3" >Habitaciones</font></td>
                  <td><input id="idhabitaciones" type="checkbox" value="habitaciones"  class="form-control"></td>
               </tr>
               <tr>
                  <td><font size="3" >Dispositivos</font></td>
                  <td><input id="iddispositivos" value="dispositivos" type="checkbox" class="form-control"></td>
               </tr>
               <tr>
                  <td><font size="3" >Usuarios</font></td>
                  <td><input id="idusuarios" value="usuarios" type="checkbox" class="form-control"></td>
               </tr>
               <tr>
                  <td><font size="3" >Control</font></td>
                  <td><input id="idcontrol" value="control" type="checkbox" class="form-control"></td>
               </tr>              
           </table>
            
        </div>
        
        <br>
        <div id="idbotonoes">
            <center>
                <button id="idguargar"  class="btn btn-primary">GUARDAR</button>
                <button id="ideditar"   class="btn btn-primary" style="display: none">GUARDAR CAMBIOS</button>
                <button id="ideliminar" class="btn btn-danger"  style="display: none">ELIMINAR</button>
            </center>
        </div>
        <br>
        
        
        
    </body>
</html>
