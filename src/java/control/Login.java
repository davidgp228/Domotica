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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author mac
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
              String accion=Consultas.getAttrib(request, "accion");
              
              switch(accion){
                  case "cerrar":
                      request.getSession().invalidate();
                      response.sendRedirect("Login.jsp");
                      return;
              }
            
              String usuario=request.getParameter( "_user");
              String pass=request.getParameter("_pass");
              
               HttpSession sesion=request.getSession(true);
               int id=validarSesion(usuario,pass);
               if(id>0){
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("userId", id);
                    sesion.setAttribute("nombre", getName(id));
                    response.sendRedirect("index.jsp");
               }
               else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Usuario o contraseña incorrectos');");
                    out.println("window.location = 'Login.jsp';");
                    out.println("</script>");
               }
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

    public int validarSesion(String usuario,String pass){
        
        boolean request=false;
        
        datasource= Conexion.getdatasource();
        try (Connection con = datasource.getConnection()){
            PreparedStatement pst=con.prepareStatement("SELECT ID FROM Usuarios where Usuario=? and Contrasena=?");
            pst.setString(1, usuario);
            pst.setString(2, pass);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return -1;
    }
    
    public String getName(int userId){
        datasource= Conexion.getdatasource();
        try (Connection con = datasource.getConnection()){
            PreparedStatement pst=con.prepareStatement("SELECT Nombre FROM Usuarios where ID=?");
            pst.setInt(1, userId);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return "";
    }
}
