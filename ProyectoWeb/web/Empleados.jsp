<%-- 
    Document   : Empleados
    Created on : 06-mar-2019, 12:10:25
    Author     : alobo 
--%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.ClsEmpleado"%>
<%@page import="Logica.ClsLgEmpleado"%>
<%@page import="Entidades.ClsPuestos"%>
<%@page import="Logica.ClsLgPuesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--JS de jquery.js-->
        <script src="JS/jquery.js" type="text/javascript"></script>
        <link href="CSS/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Global.css" rel="stylesheet" type="text/css"/>
        <title>Mantenimiento de empleados</title>
    </head>
    <body>
         <div class="img"></div>
        <div class="img"></div>
        <div class="cab">
            <h3>Empleados</h3>

        </div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <a class="nav-link " href="index.html">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Empleados
                        </a>
                        <div class="dropdown-menu bg-primary" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item badge-primary" href="#">Registro De empleados</a>
                            <a class="dropdown-item badge-primary" href="Prestamos.jsp">Prestamos</a>
                            <a class="dropdown-item badge-primary" href="Pensiones.jsp">Pensiones</a>
                        </div>
                    </li>
                    <li>
                        <a class="nav-link" href="Puestos.jsp">Puestos <span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a class="nav-link" href="#">Planillas <span class="sr-only">(current)</span></a>
                    </li>       
                </ul>

            </div>
        </nav><!-- ***************************************************************************************Barra Navegador-->

        
        <section class="container-fluid"><!--Para la tabla de empleados-->
            <div class="col-lg-12">
                <br>
                <div class="jumbotron-fluid align-content-lg-center alert-info">
                    <br>
                    <!--formulario para hacer la búsqueda de empleados -->
                    <form class="form-inline my-2 my-lg-0 col-lg-12 justify-content-center" action="Empleados.jsp" method="post">
                        <input name="txtBusId" id="txtBusId" class=" form-control mr-sm-2" type="search" placeholder="No. Identificación" aria-label="No. Identificación">
                        <input name="txtBusNom" id="txtBusNom"  class=" form-control mr-ms-2 col-md-5" type="search" placeholder="Nombre" aria-label="Nombre">&nbsp;&nbsp;
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-outline-primary my-2 my-sm-0" onclick="location.href = 'RegistroEmp.jsp?id=-1'"> Nuevo Registro</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-outline-primary my-2 my-sm-0" onclick="location.href = 'index.html'"> Atrás</button>

                    </form>
                    <br>
                </div>
                <!--Inicio de la tabla-->
                <table id="tblEmpleados" class="table table-responsive display  tbl col-lg-12 " ><!--Inicio de la tabla empleados -->
                    <thead class="cabTabla">
                        <tr>
                            <!--Crear columnas-->
                            <th>Identificación No.</th>
                            <th>Nombre</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Puesto</th>
                            <th>Fecha de Ingreso</th>
                            <th>Grado académico</th>
                            <th>&nbsp;&nbsp;</th>
                            <th>&nbsp;&nbsp;</th>

                    </thead>
                    <tbody>
                        <!--función para cargar la tabla de empleados-->
                        <%
                            

                            String Nomb="",id="",condicion="";    
                            if(request.getParameter("txtBusNom")!=null && request.getParameter("txtBusNom")!=""){
                                Nomb=request.getParameter("txtBusNom");
                            }
                            
                            if(request.getParameter("txtBusId")!=null && request.getParameter("txtBusId")!=""){
                                id=request.getParameter("txtBusId");
                            }
                             
                            //verifico cual valor no esta nulo
                            if (!Nomb.equals("") && !id.equals("")|| Nomb.equals("") && !id.equals("")){
                                
                                condicion=String.format("ID_EMPLEADO LIKE '%s'","%"+id+"%");
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
                        %>   
                        <tr>
                            <%
                                //SELECT ID_EMPLEADO,NOMBRE,TELEFONO,CORREO,COD_PUESTO,FECHA_INICIO,GRADO_ACADEMICO FROM VISTA_EMPLEADOS 
                                String cod =URLDecoder.decode(vlo_RS.getString("ID_EMPLEADO"),"UTF-8") ;
                                String Nombre =URLDecoder.decode(vlo_RS.getString("NOMBRE"),"UTF-8")  ;
                                String Telf = vlo_RS.getString("TELEFONO");
                                String Correo =URLDecoder.decode(vlo_RS.getString("CORREO"),"UTF-8") ;
                                String Puesto =URLDecoder.decode(vloPuest.getNombrePuesto(),"UTF-8") ;
                                Date FechaIng = vlo_RS.getDate("FECHA_INICIO");
                                String Grad =URLDecoder.decode(vlo_RS.getString("GRADO_ACADEMICO"),"UTF-8") ;
                            %>

                            <td><%=cod%></td>
                            <td><%=Nombre%></td>
                            <td><%=Telf%></td>
                            <td><%=Correo%></td>
                            <td><%=Puesto%></td>
                            <td><%=FechaIng%></td>
                            <td><%=Grad%></td>

                            <td><a href="RegistroEmp.jsp?id=<%=cod%>"><img src="images/iconfinder_Pencil_51713.png"/></a></td>
                            <td> <a href="EliminarEmp?id=<%=cod%>"><img src="images/basura.png"/></a></td>
                        </tr> 
                        <%}%>
                    </tbody>
                </table>
                <br>
                <%
                    if (request.getParameter("Msj")!= null) {%>

                <div id="resp" title="Respuesta">
                    <p id="resp1"><%=request.getParameter("Msj")%></p>
                </div>
                <% }%>
            </div>
        </section>
            
            
              <!--***************************************************************************************************************** -->

    <!--con este div muestro el mensaje si al presionar el botón guardar hay campos incompletos-->
    <%
    if ( request.getParameter("msj")!="El registro se eliminó con éxito" && request.getParameter("msj")!=null ){ %>        
    <div class="ui-widget" id="msEliminar" title="Mensaje De herror">
        <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
            <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                <strong>Alerta:</strong> <p><%=request.getParameter("msj")%></p> </p>
        
        </div>
    </div>
    <% }%>
    <!-- ***************************************************************************************************************** -->

        <!--Escrips-->
        <script src="JS/bootstrap.min.js" type="text/javascript"></script>
        <script src="JS/jquery-ui.min.js" type="text/javascript"></script>
        <script src="JS/jquery.dataTables.min.js" type="text/javascript"></script> 
        <script src="JS/Global.js" type="text/javascript"></script>
    </body>
</html>
