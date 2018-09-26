<%-- 
    Document   : QRGeneradorJSP
    Created on : 24-ago-2018, 13:51:46
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="robots" content="noindex,nofollow"/>
<title>Generate QR Code using QRGen and ZXing library</title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link
 href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
 rel="stylesheet" type="text/css" />

<script
 src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"
 type="text/javascript"></script>
<script
 src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
 type="text/javascript"></script>
<script
 src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
 type="text/javascript"></script> 
<script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
<script type="text/javascript">
 $(document).ready(function() {
  
  $("#samplecode").validate({
    rules: {
     qrText: "required"
   }
  });
  
 });       
    </script> 
</head>
<body>
<div id="allContent">

<% 
String qrText =  request.getParameter("qrText");
if(qrText == null){
 qrText = "";
}
%>
<div id="myContent" style="width:50%;">
 <form id="samplecode" name="samplecode" method="POST" action="QRGeneradorJSP.jsp">
   <fieldset>
    <legend><b>&nbsp;&nbsp;&nbsp;QR Code Generator - Request&nbsp;&nbsp;&nbsp;</b></legend>

    <p>
     <label for="qrText"> Input Text for QR Code </label><br /> 
     <input id="qrText" type="text" name="qrText" size="50"
     value="<%= qrText %>"
     />
    </p>
    <input id="generate" type="submit" value="Generate QR Code" />
   </fieldset>
   <%
         if (!qrText.trim().equalsIgnoreCase("")) {
            %>
            <fieldset>
    <legend><b>&nbsp;&nbsp;&nbsp;QR Code Generator - Response&nbsp;&nbsp;&nbsp;</b></legend>
    <img width="300" height="300" src="http://localhost:8080/Domotica/qrservlet?qrtext=<%= request.getParameter("qrText") %>">
   </fieldset>
            <%
         }
            %>
 </form>
</div> 
 
</div>
</body>
</html>
