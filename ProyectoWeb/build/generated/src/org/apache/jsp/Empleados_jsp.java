package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLDecoder;
import java.util.Date;
import java.sql.ResultSet;
import Entidades.ClsEmpleado;
import Logica.ClsLgEmpleado;
import Entidades.ClsPuestos;
import Logica.ClsLgPuesto;

public final class Empleados_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"CSS/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <!--JS de jquery.js-->\n");
      out.write("        <script src=\"JS/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"CSS/jquery-ui.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"CSS/jquery.dataTables.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\n");
      out.write("        <title>Mantenimiento de empleados</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div>\n");
      out.write("            <h3>Empleados</h3>\n");
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
      out.write("                    <li class=\"nav-item \">\n");
      out.write("                        <a class=\"nav-link \" href=\"index.html\">Inicio <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown active\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Empleados\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu bg-primary\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                            <a class=\"dropdown-item badge-primary\" href=\"#\">Registro De empleados</a>\n");
      out.write("                            <a class=\"dropdown-item badge-primary\" href=\"Prestamos.jsp?id=-1&msj=0\">Prestamos</a>\n");
      out.write("                            <a class=\"dropdown-item badge-primary\" href=\"Pensiones.jsp?id=-1&msj=0\">Pensiones</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"nav-link\" href=\"Puestos.jsp\">Puestos <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"nav-link\" href=\"#\">Planillas <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    </li>       \n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </nav><!-- ***************************************************************************************Barra Navegador-->\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <section class=\"container-fluid\"><!--Para la tabla de empleados-->\n");
      out.write("            <div class=\"col-lg-12\">\n");
      out.write("                <br>\n");
      out.write("                <div class=\"jumbotron-fluid align-content-lg-center alert-info\">\n");
      out.write("                    <br>\n");
      out.write("                    <!--formulario para hacer la búsqueda de empleados -->\n");
      out.write("                    <form class=\"form-inline my-2 my-lg-0 col-lg-12 justify-content-center\" action=\"Empleados.jsp\" method=\"post\">\n");
      out.write("                        <input name=\"txtBusId\" id=\"txtBusId\" class=\" form-control mr-sm-2\" type=\"search\" placeholder=\"No. Identificación\" aria-label=\"No. Identificación\">\n");
      out.write("                        <input name=\"txtBusNom\" id=\"txtBusNom\"  class=\" form-control mr-ms-2 col-md-5\" type=\"search\" placeholder=\"Nombre\" aria-label=\"Nombre\">&nbsp;&nbsp;\n");
      out.write("                        <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Buscar</button>&nbsp;&nbsp;\n");
      out.write("                        <button type=\"button\" class=\"btn btn-outline-primary my-2 my-sm-0\" onclick=\"location.href = 'RegistroEmp.jsp?id=-1'\"> Nuevo Registro</button>&nbsp;&nbsp;\n");
      out.write("                        <button type=\"button\" class=\"btn btn-outline-primary my-2 my-sm-0\" onclick=\"location.href = 'index.html'\"> Atrás</button>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                    <br>\n");
      out.write("                </div>\n");
      out.write("                <!--Inicio de la tabla-->\n");
      out.write("                <table id=\"tblEmpleados\" class=\"table table-responsive display  tbl col-lg-12 \" ><!--Inicio de la tabla empleados -->\n");
      out.write("                    <thead class=\"tblh\">\n");
      out.write("                        <tr>\n");
      out.write("                            <!--Crear columnas-->\n");
      out.write("                            <th>Identificación No.</th>\n");
      out.write("                            <th>Nombre</th>\n");
      out.write("                            <th>Teléfono</th>\n");
      out.write("                            <th>Correo</th>\n");
      out.write("                            <th>Puesto</th>\n");
      out.write("                            <th>Fecha de Ingreso</th>\n");
      out.write("                            <th>Grado académico</th>\n");
      out.write("                            <th>&nbsp;&nbsp;</th>\n");
      out.write("                            <th>&nbsp;&nbsp;</th>\n");
      out.write("\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!--función para cargar la tabla de empleados-->\n");
      out.write("                        ");

                            

                            String Nomb="",id="",condicion="";    
                            if(request.getParameter("txtBusNom")!=null && request.getParameter("txtBusNom")!=""){
                                Nomb=request.getParameter("txtBusNom");
                            }
                            
                            if(request.getParameter("txtBusId")!=null && request.getParameter("txtBusId")!=""){
                                id=request.getParameter("txtBusId");
                            }
                             
                            //verifico cual valor no esta nulo
                            if (!Nomb.equals("") && !id.equals("")|| Nomb.equals("") && !id.equals("")){
                                
                                condicion=String.format("ID_EMPLEADO = '%s'",id);
                            }else if(!Nomb.equals("") && id.equals("")){
                                condicion=String.format("NOMBRE LIKE '%S'","%"+Nomb+"%");
                            }
                            
                            
                            ResultSet vlo_RS;
                            ClsLgEmpleado vloEmp = new ClsLgEmpleado();
                            ClsPuestos vloPuest;
                            ClsLgPuesto vlo_LgPuest = new ClsLgPuesto();

                            vlo_RS = vloEmp.ListarRegistro(condicion);
                            while (vlo_RS.next()) {
                                vloPuest = vlo_LgPuest.ObtenerRegistro("COD_PUESTO=" + vlo_RS.getInt("COD_PUESTO"));
                        
      out.write("   \n");
      out.write("                        <tr>\n");
      out.write("                            ");

                                //SELECT ID_EMPLEADO,NOMBRE,TELEFONO,CORREO,COD_PUESTO,FECHA_INICIO,GRADO_ACADEMICO FROM VISTA_EMPLEADOS 
                                String cod =URLDecoder.decode(vlo_RS.getString("ID_EMPLEADO"),"UTF-8") ;
                                String Nombre =URLDecoder.decode(vlo_RS.getString("NOMBRE"),"UTF-8")  ;
                                String Telf = vlo_RS.getString("TELEFONO");
                                String Correo =URLDecoder.decode(vlo_RS.getString("CORREO"),"UTF-8") ;
                                String Puesto =URLDecoder.decode(vloPuest.getNombrePuesto(),"UTF-8") ;
                                Date FechaIng = vlo_RS.getDate("FECHA_INICIO");
                                String Grad =URLDecoder.decode(vlo_RS.getString("GRADO_ACADEMICO"),"UTF-8") ;
                            
      out.write("\n");
      out.write("\n");
      out.write("                            <td>");
      out.print(cod);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Nombre);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Telf);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Correo);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Puesto);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(FechaIng);
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(Grad);
      out.write("</td>\n");
      out.write("\n");
      out.write("                            <td><a href=\"RegistroEmp.jsp?id=");
      out.print(cod);
      out.write("\"><img src=\"images/iconfinder_Pencil_51713.png\"/></a></td>\n");
      out.write("                            <td> <a href=\"EliminarEmp?id=");
      out.print(cod);
      out.write("\"><img src=\"images/basura.png\"/></a></td>\n");
      out.write("                        </tr> \n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("                <br>\n");
      out.write("                ");

                    if (request.getParameter("Msj")!= null) {
      out.write("\n");
      out.write("\n");
      out.write("                <div id=\"resp\" title=\"Respuesta\">\n");
      out.write("                    <p id=\"resp1\">");
      out.print(request.getParameter("Msj"));
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("              <!--***************************************************************************************************************** -->\n");
      out.write("\n");
      out.write("    <!--con este div muestro el mensaje si al presionar el botón guardar hay campos incompletos-->\n");
      out.write("    ");

    if ( request.getParameter("msj")!="El registro se eliminó con éxito" && request.getParameter("msj")!=null ){ 
      out.write("        \n");
      out.write("    <div class=\"ui-widget\" id=\"msEliminar\" title=\"Mensaje De herror\">\n");
      out.write("        <div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">\n");
      out.write("            <p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>\n");
      out.write("                <strong>Alerta:</strong> <p>");
      out.print(request.getParameter("msj"));
      out.write("</p> </p>\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    ");
 }
      out.write("\n");
      out.write("    <!-- ***************************************************************************************************************** -->\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("\n");
      out.write("        <!--Escrips-->\n");
      out.write("        <script src=\"JS/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"JS/jquery-ui.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"JS/jquery.dataTables.min.js\" type=\"text/javascript\"></script> \n");
      out.write("        <script src=\"JS/Global.js\" type=\"text/javascript\"></script>\n");
      out.write("    </body>\n");
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
