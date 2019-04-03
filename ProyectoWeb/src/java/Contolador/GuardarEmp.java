/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contolador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entidades.ClsEmpleado;
import Logica.ClsLgEmpleado;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alobo
 */
public class GuardarEmp extends HttpServlet {

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
            throws ServletException, IOException, ParseException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ms="";
            ClsEmpleado vlo_Emp=new ClsEmpleado();
            ClsLgEmpleado vlo_lgEmp;
            
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd"); 
            Date f = formato.parse(request.getParameter("txtFecha"));
//            java.sql.Date fsql=new java.sql.Date(f.getTime());
//            out.print(fsql);
            
            try{
            vlo_lgEmp=new ClsLgEmpleado();    
                
            vlo_Emp.setId(request.getParameter("txtId"));
            vlo_Emp.setNombre(URLEncoder.encode( request.getParameter("txtNom"),"ISO-8859-1"));
            vlo_Emp.setApellido_1(URLEncoder.encode(request.getParameter("txtApe1"),"ISO-8859-1"));
            vlo_Emp.setApellido_2(URLEncoder.encode(request.getParameter("txtApe2"), "ISO-8859-1"));
            vlo_Emp.setGradoAcademico(URLEncoder.encode(request.getParameter("cboGrado"),"ISO-8859-1" ));
            vlo_Emp.setTelefono(request.getParameter("txtTel"));
            vlo_Emp.setCorreo(URLEncoder.encode(request.getParameter("txtCorreo"),"ISO-8859-1"));
            vlo_Emp.setFechaInicio(f);
            vlo_Emp.setCodigoPuesto(Integer.parseInt(request.getParameter("txtCodPOculto")));

            vlo_lgEmp.InsertarEmpleado(vlo_Emp);
            ms=vlo_lgEmp.getMensaje();
            response.sendRedirect("RegistroEmp.jsp?id="+vlo_Emp.getId()+"&ms="+ms);
           
            }catch(Exception ex){
             response.sendRedirect("RegistroEmp"+ex.getMessage());
             //si ocurre un herror redirecciona a una pagina de herrores y muesta el mensaje del herror 
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(GuardarEmp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GuardarEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(GuardarEmp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GuardarEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
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
