/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;

/**
 *
 * @author mac
 */
@WebServlet(name = "Consultas", urlPatterns = {"/Consultas"})
public class Consultas extends HttpServlet {
    
        public static String menuver="<nav class=\"navbar navbar-inverse navbar-fixed-top\">\n" +
"            <div class=\"container-fluid\">\n" +
"              <div class=\"navbar-header\">\n" +
"                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>                        \n" +
"                </button>\n" +
"                <a class=\"navbar-brand\" href=\"#\">Domotica</a>\n" +
"              </div>\n" +
"              <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n" +
"                <ul class=\"nav navbar-nav\">\n" +
"                  <li><a href=\"index.jsp\">Habitaciones</a></li>\n" +
"                  <li><a href=\"Dispositivos.jsp\">Dispositivos</a></li>\n" +
"                  <li><a href=\"Usuarios.jsp\">Usuarios</a></li>\n" +                
"                  <li class=\"active\"><a href=\"Ver.jsp\">Control</a></li>\n" +                
"               </ul>\n" +
"                <ul class=\"nav navbar-nav navbar-right\">\n" +
"                <li><a href=\"Login?accion=cerrar\"><span class=\"glyphicon glyphicon-user\"></span> Cerrar sesion</a></li>\n" +
"                </ul>\n" +
"              </div>\n" +
"            </div>\n" +
"          </nav>";
    
    public static String menuhabitaciones="<nav class=\"navbar navbar-inverse navbar-fixed-top\">\n" +
"            <div class=\"container-fluid\">\n" +
"              <div class=\"navbar-header\">\n" +
"                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>                        \n" +
"                </button>\n" +
"                <a class=\"navbar-brand\" href=\"#\">Domotica</a>\n" +
"              </div>\n" +
"              <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n" +
"                <ul class=\"nav navbar-nav\">\n" +
"                  <li class=\"dropdown active\">\n" +
"                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"index.jsp\">Habitaciones <span class=\"caret\"></span></a>\n" +
"                    <ul class=\"dropdown-menu\">\n" +
"                        <li><a onclick=\"agregarHabitacion()\" >Agregar</a></li>\n" +
"                        <li><a onclick=\"editarHabitacion()\"  >Editar</a></li>\n" +
"                        <li><a onclick=\"eliminarHabitacion()\" >Eliminar</a></li>\n" +
"                    </ul>\n" +
"                  </li>\n" +
"                  <li><a href=\"Dispositivos.jsp\">Dispositivos</a></li>\n" +
"                  <li><a href=\"Usuarios.jsp\">Usuarios</a></li>\n" +
"                  <li><a href=\"Ver.jsp\">Control</a></li>\n" +
"                </ul>\n" +
"                <ul class=\"nav navbar-nav navbar-right\">\n" +
"                  <li><a href=\"Login?accion=cerrar\"><span class=\"glyphicon glyphicon-user\"></span> Cerrar sesion</a></li>\n" +
"                </ul>\n" +
"              </div>\n" +
"            </div>\n" +
"          </nav>";

public static String menuusuarios="<nav class=\"navbar navbar-inverse navbar-fixed-top\">\n" +
"            <div class=\"container-fluid\">\n" +
"              <div class=\"navbar-header\">\n" +
"                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>                        \n" +
"                </button>\n" +
"                <a class=\"navbar-brand\" href=\"#\">Domotica</a>\n" +
"              </div>\n" +
"              <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n" +
"                <ul class=\"nav navbar-nav\">\n" +
"                  <li><a href=\"index.jsp\">Habitaciones</a></li>\n" +  
"                  <li><a href=\"Dispositivos.jsp\">Dispositivos</a></li>\n" +        
"                  <li class=\"dropdown\">\n" +
"                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"Usuarios.jsp\">Usuarios <span class=\"caret\"></span></a>\n" +
"                    <ul class=\"dropdown-menu\">\n" +
"                        <li><a onclick=\"agregarUsuarios()\" >Agregar</a></li>\n" +
"                        <li><a onclick=\"editarUsuarios()\"  >Editar</a></li>\n" +
"                        <li><a onclick=\"eliminarUsuarios()\" >Eliminar</a></li>\n" +
"                    </ul>\n" +
"                  </li>\n" +
"                  <li><a href=\"Ver.jsp\">Control</a></li>\n" +
"                </ul>\n" +
"                <ul class=\"nav navbar-nav navbar-right\">\n" +
"                  <li><a href=\"Login?accion=cerrar\"><span class=\"glyphicon glyphicon-user\"></span> Cerrar sesion</a></li>\n" +
"                </ul>\n" +
"              </div>\n" +
"            </div>\n" +
"          </nav>";

public static String menudispositivos="<nav class=\"navbar navbar-inverse navbar-fixed-top\">\n" +
"            <div class=\"container-fluid\">\n" +
"              <div class=\"navbar-header\">\n" +
"                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>\n" +
"                  <span class=\"icon-bar\"></span>                        \n" +
"                </button>\n" +
"                <a class=\"navbar-brand\" href=\"#\">Domotica</a>\n" +
"              </div>\n" +
"              <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n" +
"                <ul class=\"nav navbar-nav\">\n" +
"                  <li><a href=\"index.jsp\">Habitaciones</a></li>\n" +          
"                  <li class=\"dropdown\">\n" +
"                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"Dispositivos.jsp\">Dispositivos <span class=\"caret\"></span></a>\n" +
"                    <ul class=\"dropdown-menu\">\n" +
"                        <li><a onclick=\"agregarDispositivo()\" >Agregar</a></li>\n" +
"                        <li><a onclick=\"editarDispositivo()\"  >Editar</a></li>\n" +
"                        <li><a onclick=\"eliminarDispositivo()\" >Eliminar</a></li>\n" +
"                    </ul>\n" +
"                  </li>\n" +
 "                  <li><a href=\"Usuarios.jsp\">Usuarios</a></li>\n" +
"                  <li><a href=\"Ver.jsp\">Control</a></li>\n" +
"                </ul>\n" +
"                <ul class=\"nav navbar-nav navbar-right\">\n" +
"                  <li><a href=\"Login?accion=cerrar\"><span class=\"glyphicon glyphicon-user\"></span> Cerrar sesion</a></li>\n" +
"                </ul>\n" +
"              </div>\n" +
"            </div>\n" +
"          </nav>";

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Consultas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Consultas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public static String getAttrib(HttpServletRequest request,String name){
        String att=request.getParameter(name);
        if(att!=null)return att;
        else return "";
    }
    
     public static void publish(String messageString){
         
        try{
            
            String split[]=messageString.split(",");

            System.out.println("== START PUBLISHER =="+split.length+" value1 "+split[0]+" value2 "+split[1]);

            MqttClient client = new MqttClient("tcp://192.168.1.68:1883", MqttClient.generateClientId());
            client.connect();
            MqttMessage message = new MqttMessage();
            message.setPayload(split[1].getBytes());
            client.publish(split[0], message);
           

            System.out.println("\tMessage '"+ messageString +"' to 'iot_data'");

            client.disconnect();

            System.out.println("== END PUBLISHER ==");
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
