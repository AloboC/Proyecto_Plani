package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Logica.ClsLgPlanilla;
import java.sql.ResultSet;
import java.net.URLDecoder;

public final class RegistroPlanilla_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"CSS/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"JS/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"CSS/jquery-ui.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"CSS/jquery.dataTables.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\n");
      out.write("    <section>\n");
      out.write("        <div id=\"\" class=\"\">\n");
      out.write("            <table id=\"\" class=\"tbl tabla table-responsive-md display\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th hidden=\"\">Código Planilla</th>\n");
      out.write("                        <th>N° Identificación</th>\n");
      out.write("                        <th>Nombre</th>\n");
      out.write("                        <th>Salario Bruto</th>\n");
      out.write("                        <th>Salario Neto</th>\n");
      out.write("                        <th>Pago Primer Quincena</th>\n");
      out.write("                        <th>Pago segunda Quincena</th>\n");
      out.write("                        <th>&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("\n");
      out.write("                    ");

                        if (request.getParameter("cboMes") != null && request.getParameter("txtAnio") != null) {
                            String pvn_Annio = request.getParameter("txtAnio");
                            String pvn_Mes = request.getParameter("cboMes");
                            String vlc_Sentencia = "";
                            int codP = 0;
                            String id = "";
                            ResultSet vlo_Rs;
                            ClsLgPlanilla vlo_LgPlanilla = new ClsLgPlanilla();
                            vlc_Sentencia = String.format("ANNIO = %s AND MES='%s'", pvn_Annio, pvn_Mes);
                            vlo_Rs = vlo_LgPlanilla.ListarRegistros(vlc_Sentencia, 1);
                            while (vlo_Rs.next()) {
                                codP = vlo_Rs.getInt("COD_PLANILLA");
                                id = vlo_Rs.getString("ID_EMPLEADO");
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td hidden=\"\">");
      out.print(codP);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(id);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(URLDecoder.decode(vlo_Rs.getString("EMPLEADO"), "UTF-8"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( vlo_Rs.getDouble("SALARIO_BRUTO"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vlo_Rs.getDouble("SALARIO_NETO"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vlo_Rs.getDouble("QUINCENA_1"));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vlo_Rs.getDouble("QUINCENA_2"));
      out.write("</td>\n");
      out.write("                        <td><td><a href=\"DetallePlanilla.jsp?id=");
      out.print(codP);
      out.write("&Cop=");
      out.print(id);
      out.write("\" class=\"\"><img src=\"images/iconfinder_Select_46755.png\" /></a></td>  \n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
                            }
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
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
      out.write("\n");
      out.write("    <h1>Hello World!</h1>\n");
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
