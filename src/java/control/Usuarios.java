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
@WebServlet(name = "Usuarios", urlPatterns = {"/Usuarios"})
public class Usuarios extends HttpServlet {

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
            out.println("<title>Servlet Usuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuarios at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    
    private static String insertarUsuarios(String nombre, String usuario,String contrasena, String permisos){
        String request="",validarnombre="", validarusuario="";
        boolean exist=false;
        int id=0;;
        
        try(Connection con = Conexion.getdatasource().getConnection();
              PreparedStatement pstvalidar=con.prepareStatement("SELECT Nombre,Usuario FROM Usuarios");
            PreparedStatement pst= con.prepareStatement("INSERT INTO Usuarios (Nombre,Usuario,Contrasena) VALUES (?,?,?)");
            PreparedStatement pstconsultarid=con.prepareStatement("SELECT MAX(ID) FROM Usuarios");
            PreparedStatement pstinsertarpermisos=con.prepareStatement("INSERT INTO Permisos (fkUsuario,Permiso) VALUES (?,?)")){
            
            ResultSet validar=pstvalidar.executeQuery();
            
            
            while(validar.next()){
                validarnombre= validar.getString(1);
                validarusuario=validar.getString(2);
                
                if(validarnombre.equals(nombre)||validarusuario.equals(usuario)){
                    exist=true;
                    break;
                }
            }
            
            if(exist){
               return request="El nombre o usuario ya se encuentran registrados";
            }
            else{
                pst.setString(1, nombre);
                pst.setString(2, usuario);
                pst.setString(3, contrasena);
                pst.execute();
                
                //*** Seleccionar ultimo id de usarios 
                ResultSet rsid=pstconsultarid.executeQuery();
                rsid.next();
                id= rsid.getInt(1);
                
                String []split= permisos.split(",");
                
                for (String permiso : split) {
                   pstinsertarpermisos.setInt(1, id);
                   pstinsertarpermisos.setString(2, permiso);
                   pstinsertarpermisos.execute();
                }
                
                request="Datos insertados correctamente";
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }
    
       public static String eliminarUsuario(String idusuario){
        String request="No se ha podido eliminar el usuario";
        
        try(Connection con= Conexion.getdatasource().getConnection();
            PreparedStatement pst= con.prepareStatement("DELETE FROM Usuarios WHERE ID=?");
            PreparedStatement psteliminarpermisos= con.prepareStatement("DELETE FROM Permisos WHERE FkUsuario=?")){
            
            psteliminarpermisos.setString(1, idusuario);
            psteliminarpermisos.execute();
            
            pst.setString(1, idusuario);
            pst.execute();
            
            request="Datos eliminados correctamente";
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return request;
    }
       
       public static String actualizarUsuario(){
            String request="";

            return request;
       }

}
