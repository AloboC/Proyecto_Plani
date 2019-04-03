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
import Entidades.ClsPlanilla;
import Logica.ClsLgPlanilla;

/**
 *
 * @author alobo
 */
public class GuardarPlanilla extends HttpServlet {

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
            
             /*****************************************************************
              * hago una entidad de planilla nueva para que tome el valor del código como 0
              * ya que no se lo estoy mandando porque el SP básicamente solo necesita el año y el mes 
              */
            int codP = 0;
            int anio = 0;
            String Ms = "", mes = "";
            
           
            ClsPlanilla vlo_Planilla = new ClsPlanilla();
            ClsLgPlanilla vloLg_Planilla;
            try {
                mes = request.getParameter("cboMes");
                anio = Integer.parseInt(request.getParameter("txtAnio"));
                vlo_Planilla.setAnnio(anio);
                vlo_Planilla.setMes(mes);
                vloLg_Planilla = new ClsLgPlanilla();
                codP = vloLg_Planilla.LgCrearPlanilla(vlo_Planilla);
                Ms = vloLg_Planilla.getMensaje();
                if (codP == 0) {
                    response.sendRedirect("RegistroPlanilla.jsp?cboMes=" + mes + "&txtAnio=" + anio + "&Info=" + Ms);
                } else {
                    response.sendRedirect("RegistroPlanilla.jsp?cboMes=" + mes + "&txtAnio=" + anio + "&Msj=" + Ms);

                }
            } catch (Exception ex) {
                response.sendRedirect("RegistroPlanilla.jsp?cboMes=" + mes + "&txtAnio=" + anio + "&Error=" + ex.getMessage());

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
