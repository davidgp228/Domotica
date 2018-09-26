/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mac
 */
@WebServlet(name = "Dispositivos", urlPatterns = {"/Dispositivos"})
public class Dispositivos extends HttpServlet {

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
            
             String accion= Consultas.getAttrib(request, "accion");
             String fkhabitacion= Consultas.getAttrib(request, "_idhabitacion");
             String nombre= Consultas.getAttrib(request, "_nombre");
             String tipo= Consultas.getAttrib(request, "_tipo");
             String idunico= Consultas.getAttrib(request, "_idunico");
             
             switch(accion){
                 case "insertarDispositivo":
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+insertarDispositivo(fkhabitacion,nombre,"",tipo,idunico)+"');");
                     out.println("window.location = 'Dispositivos.jsp';");
                     out.println("</script>");
                     break;
                     
             }
        }
    }
    
    public static String obtenerDispositivos(String idseleccionado,String fkhabitacion){
        String request="";
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("SELECT * FROM Dispositivo2 WHERE FkHabitacion=?")){
            pst.setString(1, fkhabitacion);
            ResultSet rs= pst.executeQuery();
            
            String s, s2;
            while(rs.next()){
                s=rs.getString("ID");
                s2=rs.getString("Nombre");
            
                if(idseleccionado.equals(s))
                request+="<option  value='"+s+"' selected>"+s2+"</option> \n";
                else
                request+="<option value='"+s+"'>"+s2+"</option> \n";
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }

    public static String obtenerDispositivosHabitacion(String idhabitacion){
        String request= "";
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("SELECT ID,Nombre,Tipo,IDunico FROM Dispositivo2 WHERE FkHabitacion=? ")){
            pst.setString(1, idhabitacion);
            ResultSet rs= pst.executeQuery();
            
            while(rs.next()){
                request+="<tr> <td> <center> <button id=\""+rs.getString(1)+"\" class=\"btn btn-default\" value=\""+rs.getString(4)+","+rs.getString(3)+"\" onclick=\"publicar(this.id)\" style=\"margin-top:10px\" type=\"button\"   º>"+rs.getString(2)+"</button> </center> </td> </tr>";
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }
    
    public static String insertarDispositivo(String fkhabitacion, String nombre , String imagen, String tipo, String idunico){
        String request="No se han podido insertar los datos";
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("INSERT INTO Dispositivo2 "
                    + "(FkHabitacion,Nombre,Imagen,Tipo,IDunico) VALUES (?,?,?,?,?)")){
            pst.setString(1, fkhabitacion);
            pst.setString(2, nombre);
            pst.setString(3, imagen);
            pst.setString(4, tipo);
            pst.setString(5, idunico);
            
            pst.execute();
            
            request="Datos insertados correctamente";
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
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
