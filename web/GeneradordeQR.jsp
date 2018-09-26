<%-- 
    Document   : GeneradordeQR
    Created on : 23-ago-2018, 11:42:15
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Generador de códigos QR</title>
        
        <!-- Import jquery-->
        <script src="js/jquery.js"></script>
        
        <script type="text/javascript" src="js/qrcode.js"></script>
        
    </head>
    
    <body>
        <div data-role="content">
            <form>
            <textarea name="msg" rows="10" cols="40">Texto a codificar</textarea><br> 
            <input type="button" value="Generar" onclick="update_qrcode()">
            </form>
            <div id="qr"></div>
        </div>
    </body>
    
</html>