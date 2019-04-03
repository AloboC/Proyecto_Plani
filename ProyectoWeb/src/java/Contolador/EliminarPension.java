/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contolador;

import Entidades.ClsEmpleado;
import Logica.ClsLgEmpleado;
import Entidades.ClsPension;
import Logica.ClsLgPensiones;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alobo
 */
public class EliminarPension extends HttpServlet {

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

            ClsLgPensiones vloLg_Pension;
            ClsLgEmpleado vloLg_Empleado;
            ClsEmpleado vlo_Empleado=new ClsEmpleado();
            String msj="";
            String Nombre="";
            
            try { 
                String IdEmp = request.getParameter("idEmp");
                int codPension = Integer.parseInt(request.getParameter("codP"));
                
                /*Obtengo el registro del empleado del que recibi por parametro para tomar el nombre y devolverlo */
                vloLg_Empleado=new ClsLgEmpleado();
                vlo_Empleado=vloLg_Empleado.ObtenerRegistro(IdEmp);
                Nombre = String.format("%s %s %s", vlo_Empleado.getNombre(), vlo_Empleado.getApellido_1(), vlo_Empleado.getApellido_2()); 
                
                vloLg_Pension=new ClsLgPensiones();
                vloLg_Pension.Eliminar(codPension);
                msj=vloLg_Pension.getMensaje();
                
                
                
                response.sendRedirect("Pensiones.jsp?txtPensionIdEmp="+vlo_Empleado.getId()+"&txtPensionNom="+Nombre+"&msj="+msj);
   
            } catch (Exception ex) {
               response.sendRedirect("Pensiones.jsp?txtPensionIdEmp="+vlo_Empleado.getId()+"&txtPensionNom="+Nombre+"&msj="+ex.getMessage());
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
