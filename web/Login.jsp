<%-- 
    Document   : Login
    Created on : 27-jul-2018, 17:28:40
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DOMOTICA</title>
        
        <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        
    </head>
    <body style="background-color: #D0FBE6 ">
        <div class="container">
            
        <div class="row register-form">
            <div class="col-md-10 col-md-offset-1">
                <div class="login-card">
                    <img src="images/icono2.png" class="profile-img-card">
                    <p class="profile-name-card"> </p>
                    <form action="Login" class="form-signin" method="post"><span class="reauth-email"> </span>
                    <h3><font color='red'></font></h3>
                        <input class="form-control" type="text" name="_user" required="" placeholder="Usuario" id="usuario">
                        <input class="form-control" type="password" name="_pass" required="" placeholder="Contraseña" id="pass">
                        <div class="checkbox">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="recordar">Recordar</label>
                            </div>
                        </div>
                        <br>
                        <button class="btn btn-primary btn-block btn-lg btn-signin"  onclick="entrar()">Entrar </button>
                        
                    </form>	
                </div>
                
    <script>                     
        $(document).ready(function() {
            
            if( getCookie('cookieRecordar')==='si'){
                $('#recordar').prop( "checked","checked");
                $('#usuario').val(getCookie('cookieRecordarUsr'));
                $('#pass').val(getCookie('cookieRecordarPass'));
            }
            
        });        
    </script>
    
    <script>
        
        function vercontrasena(){
            if($("#idvercontrasena").is(':checked'))
            document.getElementById('pass').type = 'text';
            else
                 document.getElementById('pass').type = 'password';
        }
        
        function setCookie(cname, cvalue) {
            var d = new Date();
            d.setTime(d.getTime() + (365*24*60*60*1000));
            var expires = "expires="+ d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }
        
        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i <ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
        
        function entrar(){
            
            if($("#recordar").is(':checked')){
                setCookie('cookieRecordar', "si");
                setCookie('cookieRecordarUsr', $('#usuario').val());
                setCookie('cookieRecordarPass', $('#pass').val());
            }else{
                document.cookie = "cookieRecordar=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                document.cookie = "cookieRecordarUsr=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                document.cookie = "cookieRecordarPass=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            }        
        }
        
    </script>
                
            </div>
        </div>
            
            <center><a href="https://mega.nz/#!5sxQnaLB!uTJWcuTOlU2L8J22kgEABueWjuKcxvZJCOcHDu9bwUY">Descargar aplicacion</a></center>
            
    </div>
        
        
    </body>
</html>
