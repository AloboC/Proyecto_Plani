package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Logica.ClsLgPlanilla;
import java.sql.ResultSet;
import java.net.URLDecoder;

public final class DetallePlanilla_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"CSS/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"JS/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"CSS/jquery-ui.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"CSS/jquery.dataTables.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("            <h3>Generar Planilla</h3>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-primary\">\n");
      out.write("\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                <ul class=\"navbar-nav mr-auto\">\n");
      out.write("                    <li class=\"nav-item active\">\n");
      out.write("                        <a class=\"nav-link \" href=\"index.html\">Inicio <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Empleados\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu  bg-primary badge-primary\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item badge-primary \" href=\"Empleados.jsp?msj=''\">Registro De empleados</a>\n");
      out.write("                            <a class=\"dropdown-item badge-primary\" href=\"Prestamos.jsp?id=-1&msj=0\">Prestamos</a>\n");
      out.write("                            <a class=\"dropdown-item badge-primary\" href=\"Pensiones.jsp?id=-1&msj=0\">Pensiones</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"nav-link\" href=\"Puestos.jsp?txtCodP=1\">Puestos <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"nav-link\" href=\"RegistroPlanilla.jsp\">Planillas <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("    <secti>\n");
      out.write("        <div id=\"\" class=\"col-lg-12 my-lg-3\">\n");
      out.write("\n");
      out.write("            ");
 if (request.getParameter("cboMes") != null && request.getParameter("txtAnio") != null) {
                        //MUESTRO EN PANTALLA UN TITULO CON EL MES Y EL AÑO DE LA PLANILLA
      out.write("\n");
      out.write("            <h3>Planilla de ");
      out.print(request.getParameter("cboMes"));
      out.write(" del ");
      out.print(request.getParameter("txtAnio"));
      out.write(" </h3>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            <table id=\"\" class=\"tblC tabla table-responsive-sm col-lg-12 display\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th hidden=\"\">Código Planilla</th>\n");
      out.write("                        <th>Fecha</th>\n");
      out.write("                        <th>Identificación</th>\n");
      out.write("                        <th>Nombre</th>\n");
      out.write("                        <th>Salario</th>\n");
      out.write("                        <th>Salario Bruto</th>\n");
      out.write("                        <th>Salario Neto</th>\n");
      out.write("                        <th>Pago Primer Quincena</th>\n");
      out.write("                        <th>Pago segunda Quincena</th>\n");
      out.write("                        <th>Descripción</th>\n");
      out.write("                        <th>Monto</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    ");

                      String anio = "", mes = "", CodPlan = "", IdEmp = "",vlc_Sentencia = "",id="";
                      int codP=0;
                        if (request.getParameter("id") != null && request.getParameter("Cop") != null && request.getParameter("Ao") != null && request.getParameter("ms") != null) {
                            anio = URLDecoder.decode(request.getParameter("Ao"), "UTF-8");
                            mes = URLDecoder.decode(request.getParameter("ms"), "UTF-8");
                            CodPlan = URLDecoder.decode(request.getParameter("Cop"), "UTF-8");
                            IdEmp = URLDecoder.decode(request.getParameter("id"), "UTF-8");  
                            
                            ResultSet vlo_Rs;
                            ClsLgPlanilla vlo_LgPlanilla = new ClsLgPlanilla();
                            vlc_Sentencia = String.format("PLANILLAS.COD_PLANILLA= %s AND EMPLEADOS.ID_EMPLEADO ='%s'", CodPlan, IdEmp);
                            vlo_Rs = vlo_LgPlanilla.ListarRegistros(vlc_Sentencia, 2);
                           
                            while (vlo_Rs.next()) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input id=\"tcPlanilla\" name=\"tcPlanilla\" type=\"\" value=\"");
      out.print(vlo_Rs.getInt("COD_PLANILLA"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tFecha\" name=\"tFecha\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("FECHA"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tId\" name=\"tId\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("ID_EMPLEADO"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tNombre\" name=\"tNombre\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("EMPLEADO"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tSalario\" name=\"tSalario\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("SALARIO"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tSalarioBru\" name=\"tSalarioBru\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("SALARIO_BRUTO"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tSalarioN\" name=\"tSalarioN\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("SALARIO_NETO"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tQ1\" name=\"tQ1\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("QUINCENA_1"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td><input id=\"tQ2\" name=\"tQ2\" type=\"\" value=\"");
      out.print(URLDecoder.decode(vlo_Rs.getString("QUINCENA_2"),"UTF-8"));
      out.write("\"/></td>\n");
      out.write("                        <td>");
      out.print(URLDecoder.decode(vlo_Rs.getString("DESCRIPCION"),"UTF-8"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(URLDecoder.decode(vlo_Rs.getString("MONTO"),"UTF-8"));
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
                            } else {
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"alert alert-danger alert-dismissible\">\n");
      out.write("            <button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button>\n");
      out.write("            <strong>Error !</strong>");
      out.print("No hay registros para este empleado");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    ");
 }
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </secti>       \n");
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <script src=\"JS/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"JS/jquery-ui.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"JS/jquery.dataTables.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"JS/Global.js\" type=\"text/javascript\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
