<%-- 
    Document   : Croquis
    Created on : 30-jul-2018, 16:45:20
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.index"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="js/jquery.js"></script>
        
        <title>ALBA DTI</title>
        
        <!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <form name="myForm" method="GET">
        <%
            String letra="3";
            int botones[]= new int[10];
            String mensaje=index.getAttrib(request, "_id");

            if(!mensaje.equals("")){
                index.publish(mensaje);
            }
       %>

    <center><font size="5" color="#0033cc">Bienvenido domotica 2!</font></center>
    <br>
    
    <input type="hidden" id="id" name="_id" value="">
    
    <!--
    <center>
        <button class="btn btn-default" id="idazul" style="width:80px; height:35px; background-color: #4da6ff;color: #ffffff;" value="BLUE" onclick="publicar(this.id)">Azul</button>
        <button class="btn btn-default" id="idrojo" style="width:80px; height:35px; background-color: #ff471a;color: #ffffff;" value="RED" onclick="publicar(this.id)">Rojo</button>
    </center>-->
    
    
    
       <table class="table">
           <tr>
               <td bgcolor="#ccffff">
                     <center><font size="<%=letra%>" color="#0033cc" >Recamara1</font></center>
                     <center><button id="btn1" value="recamara1,foco1" class="btn" onclick="publicar(this.id)" ><i class="fa fa-power-off"></i></button></center>
               </td>
               <td bgcolor="#ffe0b3">
                    <center><font size="<%=letra%>" color="#0033cc">Cocina</font></center>
                    <center><button id="btn2" value="cocina,foco1" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
               <td bgcolor="#ccffff">
                    <center><font size="<%=letra%>" color="#0033cc">Recamara2</font></center>
                    <center><button id="btn3" value="recamara2,foco1" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
           </tr>
           <tr>
               <td colspan="3" bgcolor="#ffffb3">
                   <center><font size="<%=letra%>" color="#0033cc">Sala</font></center>
               </td>
           </tr>
           <tr>
               <td  bgcolor="#ffffb3">
                    <center><button id="btn4" value="sala,foco1" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
                 <td  bgcolor="#ffffb3">
                    <center><button id="btn5" value="sala,foco2" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
                <td  bgcolor="#ffffb3">
                    <center><button id="btn6" value="sala,foco3" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
                </td>
           </tr>
           <tr  >
               <td  bgcolor="#ccff99" colspan="2">
                   <center><font size="<%=letra%>" color="#0033cc">Patio</font></center>
               </td>
               <td bgcolor="#ccffff">
                   <center><font size="<%=letra%>" color="#0033cc">Recamara principal</font></center>
                   <center><button id="btn7" value="recamaraPrincipal,foco1" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
           </tr>
           <tr>
               <td  bgcolor="#ccff99" colspan="2">
                   <center><font size="<%=letra%>" color="#0033cc"></font></center>
               </td> 
                <td bgcolor="#80ffcc">
                   <center><font size="<%=letra%>" color="#0033cc">Oficinas</font></center>
                   <center><button id="btn8" value="oficinas,foco1" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
                   <center><button id="btn9" value="oficinas,foco2" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
                   <center><button id="btn10" value="oficinas,foco3" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>
               </td>
           </tr>
           <tr>
               <td  bgcolor="#80ffcc" >
                    <center><button id="btn11" value="oficinas,foco4" class="btn" onclick="publicar(this.id)"><i class="fa fa-power-off"></i></button></center>                   
               </td> 
                <td  bgcolor="#80ffcc" colspan="2">
               </td> 
               
           </tr>
           
       </table>
       </form>
    </body>
    <script type="text/javascript" src="js/index.js"></script>
</html>
