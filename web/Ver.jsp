<%-- 
    Document   : Ver
    Created on : 28-jul-2018, 14:09:41
    Author     : mac
--%>

<%@page import="control.Dispositivos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.Consultas"%>
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
        
        String []datosHabitacion= null;
        
        String idhabitacion=Consultas.getAttrib(request, "_buscarhabitacion");
        
        if(!idhabitacion.equals("")){
               datosHabitacion= Habitaciones.obtenerHabitacion(idhabitacion);
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
        
        <style>
            .dispositivoscroll {
                width:80px;
                height:220px;
                overflow:scroll;
            }
            .table-wrapper-scroll-y {
                display: block;
                max-height: 200px;
                overflow-y: auto;
                -ms-overflow-style: -ms-autohiding-scrollbar;
            }
        </style>
        
    </head>
    <body >
        
        <%=Consultas.menuver%>
         
        <form action="Ver.jsp" class="container" style="margin-top:60px">
            <%
               String nombre=datosHabitacion==null?"---":datosHabitacion[1];
                String imagen=datosHabitacion==null?"images/addimage.png":datosHabitacion[2];%>
            
            <select id="idbuscarhabitacion" name="_buscarhabitacion" class="form-control" onchange="this.form.submit()" >
                <option value="">Seleccionar</option>
                <% 
                 String idSeleccionado= datosHabitacion==null?"":datosHabitacion[0];
                 String habitaciones =Habitaciones.nombreHabitaciones(idSeleccionado); 
                %>
                <%=habitaciones%>
            </select>
            
            <br>
            
            <center><font id="idnombrehabitacion" size="5" color="#0033cc" ><%=nombre%></font></center>
            
            
        <!--    <table class="table">
                <tr>
                    <td height="280">
                         <center> <img id="imgSalida" width="200" height="180" src="<%=imagen%>"  /></center>
                    </td>
                    <td>
                     
                        <div class="dispositivoscroll">
                            
                           
                            
                        </div>
                    </td>
                </tr>
            </table>-->
                            
            <table id="dtVerticalScrollExample" class="table table-striped table-sm" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>
                             <center> <img id="imgSalida" width="200" height="180" src="<%=imagen%>"  /></center>
                        </th>
                    </tr>
                </thead>  

            </table>     
                
                <div class="table-wrapper-scroll-y">
                    <table class="table table-bordered table-striped">
                         <%
                            String dispositivos= Dispositivos.obtenerDispositivosHabitacion(idSeleccionado);
                            %>
                     <%=dispositivos%>
                    </table>
                </div>
        </form>
                
              
                
       <script type="text/javascript" src="js/ver.js"></script>
    </body>
</html>

