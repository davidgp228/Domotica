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
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author mac
 */
@WebServlet(name = "Habitaciones", urlPatterns = {"/Habitaciones"})
public class Habitaciones extends HttpServlet {
    
    BasicDataSource datasource;

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
             String id= Consultas.getAttrib(request, "_idhabitacion");
             String imagen= Consultas.getAttrib(request, "_imagen");
             String nombre= Consultas.getAttrib(request, "_nombre");
             
             System.out.println("Datos: "+id+ " "+nombre );
             
             switch(accion){
                case "insertarHabitacion":
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+insertarHabitacion(nombre,imagen)+"');");
                     out.println("window.location = 'index.jsp';");
                     out.println("</script>");
                     break;
                case "editarHabitacion":
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+actualizarHabitacion(id,nombre,imagen)+"');");
                     out.println("window.location = 'index.jsp';");
                     out.println("</script>");
                    break;
                case "eliminarHabitacion":
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+eliminarHabitacion(id)+"');");
                     out.println("window.location = 'index.jsp';");
                     out.println("</script>");
                    break;
             }
        }
    }

    public static String[] obtenerHabitacion(String id){
        String[] request= new String [3];
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("SELECT * FROM Habitacion2 WHERE ID=?")){
            pst.setString(1, id);
            ResultSet rs= pst.executeQuery();
            
            if(rs.next()){
                request[0]= rs.getString(1);
                request[1]= rs.getString(2);
                request[2]= rs.getString(3);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }
    
    public static String nombreHabitaciones(String idseleccionado){
        String request ="";
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("SELECT ID,Nombre FROM Habitacion2");
            ResultSet rs= pst.executeQuery();){
            
            String s, s2;
            while(rs.next()){
                s=rs.getString(1);
                s2=rs.getString(2);
            
                if(idseleccionado.equals(s))
                request+="<option  value='"+s+"' selected>"+s2+"</option> \n";
                else
                request+="<option value='"+s+"'>"+s2+"</option> \n";
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return request;
    }
    
    public static String insertarHabitacion(String nombre, String imagen){
        String request="Error al insertar";
        
        try(Connection con = Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("INSERT INTO Habitacion2 (Nombre,Imagen) VALUES (?,?)")){
            pst.setString(1, nombre);
            pst.setString(2, imagen);
            pst.execute();
            
            request="Datos insertados correctamente";
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }
    
    public static String actualizarHabitacion(String ID,String nombre,String imagen){
        String request ="No se han podido actualizar los datos";
            
            try(Connection con=Conexion.getdatasource().getConnection();
                PreparedStatement pst= con.prepareStatement("UPDATE Habitacion2 SET Nombre=?,Imagen=? WHERE ID=?")){
                pst.setString(1, nombre);
                pst.setString(2, imagen);
                pst.setString(3, ID);
                pst.execute();
                request="Datos actualizados correctamente";
            
            }catch(Exception e){
                e.printStackTrace();
            }
        
        return request;
    }
    
    public static String eliminarHabitacion(String id){
        String request="No se han podido eliminar los datos";
        
            try(Connection con= Conexion.getdatasource().getConnection();
                PreparedStatement psteliminarhabitacion= con.prepareStatement("DELETE FROM Habitacion2 WHERE ID=?");
                PreparedStatement psteliminardispositivos= con.prepareStatement("DELETE FROM Dispositivo2 WHERE FkHabitacion=?");){
                
                psteliminardispositivos.setString(1, id);
                psteliminardispositivos.execute();
                
                psteliminarhabitacion.setString(1, id);
                psteliminarhabitacion.execute();
                
                request="Datos eliminados correctamente";
                
            }catch(Exception e){
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
