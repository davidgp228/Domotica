<%-- 
    Document   : GeneradordeQR2
    Created on : 23-ago-2018, 13:05:45
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Testing QR code</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function generateBarCode()
            {
                var texto = $('#text').val();
                var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + texto + '&amp;size=100x1000';
                $('#barcode').attr('src', url);
            }
        </script>
    </head>
    <body>
        <input id="text" type="text" value="NRIC or Work Permit" style="Width:20%"onblur='generateBarCode();' /> 

      <img id='barcode' 
            src="https://api.qrserver.com/v1/create-qr-code/?data=HelloWorld&amp;size=100x100" 
            alt="" 
            title=""
            width="100" 
            height="100" />
    </body>
</html>