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
import Entidades.ClsPension;
import Logica.ClsLgPensiones;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author alobo
 */
public class GuardarPension extends HttpServlet {

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
        
            /*****************
             * hago un sinpleDateformat para pasar la fecha que viene como tipo String a un tipo date y asi poder mandarla por medio de la entidad 
             */

            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            ClsPension vlo_Pencion=null;
            String msj="";
            String Nombre="";

            try {
                
                 Nombre = request.getParameter("txtNombEmp");
                String IdEmp = request.getParameter("txtIdEmp");
                int codPension = Integer.parseInt(request.getParameter("txtCodigoPension"));
                double Monto = Double.parseDouble(request.getParameter("txtMonto"));
                Date f = formato.parse(request.getParameter("txtFecha"));
                java.sql.Date fsql=new java.sql.Date(f.getTime());
                
//               
                vlo_Pencion=new ClsPension(codPension, IdEmp, Monto,fsql);
                
               ClsLgPensiones vloLg_Pension=new ClsLgPensiones();
               vloLg_Pension.InsertarEmpleado(vlo_Pencion);
                msj=vloLg_Pension.getMensaje();
                response.sendRedirect("Pensiones.jsp?txtPensionIdEmp="+vlo_Pencion.getIdEmpleado()+"&txtPensionNom="+Nombre+"&msj="+msj);
   
            } catch (Exception ex) {
               response.sendRedirect("Pensiones.jsp?txtPensionIdEmp="+vlo_Pencion.getIdEmpleado()+"&txtPensionNom="+Nombre+"&msj="+ex.getMessage());

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

}
