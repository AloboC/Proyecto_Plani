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
import Entidades.ClsPuestos;
import Logica.ClsLgPuesto;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 *
 * @author alobo
 */
public class GuardarPuestos extends HttpServlet {

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
            
            ClsPuestos vlo_Puesto;
            ClsLgPuesto vloLg_Puestos;
            String msj="";
            
            
            try{
            
            int codP=Integer.parseInt(request.getParameter("txtCodP"));
            String nomP=URLEncoder.encode(request.getParameter("txtNombP"),"ISO-8859-1") ;
            int catP=Integer.parseInt(request.getParameter("cboCategoria"));
            double salario=Double.parseDouble(request.getParameter("txtSalario"));
            //se guardan los valores en la entida para mandarla al Procedimiento
            vlo_Puesto=new ClsPuestos(codP, nomP, catP, salario);
            
            vloLg_Puestos=new ClsLgPuesto();
            vloLg_Puestos.InsertarPuesto(vlo_Puesto);
            msj=vloLg_Puestos.getMensaje();
            
            response.sendRedirect("Puestos.jsp?ms="+msj);
         
            }catch(Exception ex){
                 response.sendRedirect("Puestos.jsp?ms="+msj);

            }//fin del catch
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
