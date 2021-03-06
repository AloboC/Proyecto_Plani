/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contolador;

import Entidades.ClsEmpleadosTitulos;
import Entidades.ClsTitulos;
import Logica.ClsLgTitulos;
import Logica.ClsLgEmpleados_Titulos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.servlet.http.HttpServletResponse.SC_BAD_REQUEST;

/**
 *
 * @author alobo
 */
public class AsignarTitulo extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     
            ClsEmpleadosTitulos vlo_ET;
            ClsLgEmpleados_Titulos vloLgET;
            ClsTitulos vloTitulo;
            ClsLgTitulos vloLgTitulo;
            String msj="";
            int codigo=Integer.parseInt(request.getParameter("txtCodTit"));
            String Id=request.getParameter("txtCodEmp");
            //Recibe parametros del nombre del titulo y el nombre de la institucion
            String NomTit=URLEncoder.encode(request.getParameter("txtTitulo"),"ISO-8859-1");
            String NomInst=URLEncoder.encode(request.getParameter("txtInst"),"ISO-8859-1");

            
            try{
                //Primero guarda o modifica el titulo
                vloTitulo=new ClsTitulos(codigo,NomTit,NomInst);
                vloLgTitulo=new ClsLgTitulos();
                codigo=vloLgTitulo.InsertarTitulo(vloTitulo);
                
                /*Despues de guardarlo hace el enlace insertando el codigo del titulo y el id del empleado 
                  en la tabla titulos empleados despues de que guarda o modifica el titulo crea un objeto de tipo
                Empleado titulo para hacer el enlase entre el empleado y los titulos*/
                  
                 vlo_ET=new ClsEmpleadosTitulos(codigo, Id);
                
                vloLgET=new ClsLgEmpleados_Titulos();
                vloLgET.LgAsignarTitulo(vlo_ET);
                msj=vloLgET.getMensaje();
                response.sendRedirect("RegistroEmp.jsp?id="+Id+"&ms="+msj);
            }catch(Exception ex){
               response.sendError(SC_BAD_REQUEST, ex.getMessage());
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
        } catch (Exception ex) {
            Logger.getLogger(AsignarTitulo.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(AsignarTitulo.class.getName()).log(Level.SEVERE, null, ex);
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
