<%-- 
    Document   : Prestamos
    Created on : 08-mar-2019, 14:03:38
    Author     : alobo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.ClsEmpleado"%>
<%@page import="Logica.ClsLgPuesto"%>
<%@page import="Entidades.ClsPuestos"%>
<%@page import="Logica.ClsLgEmpleado"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Logica.ClsLgPensiones"%>
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
        <title>Registro de Pensiones</title>
    </head>
   
    <body class="color">
        <div class="img"></div>
        <div class="cab">
            <h3>Registro de Pensiones</h3>

        </div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link " href="index.html">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Empleados
                        </a>
                        <div class="dropdown-menu  bg-primary badge-primary" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item badge-primary " href="Empleados.jsp">Registro De empleados</a>
                            <a class="dropdown-item badge-primary" href="Prestamos.jsp">Prestamos</a>
                            <a class="dropdown-item badge-primary" href="#">Pensiones</a>
                        </div>
                    </li>
                    <li>
                        <a class="nav-link" href="Puestos.jsp">Puestos <span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a class="nav-link" href="RegistroPlanilla.jsp">Planillas <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>


        <section> 
            <%
                //Capturo los valores que se mandaron por el metodo post del formulario 
                //para copiarlos en los campos del formulario nuevamente
                String valor1 = "";
                String valor2 = "";

                String Id = request.getParameter("txtPensionIdEmp");
                String Nom = request.getParameter("txtPensionNom");
                if (Id != null) {
                    valor1 = URLDecoder.decode(Id, "UTF-8");
                }
                if (Nom != null) {
                    valor2 = URLDecoder.decode(Nom, "UTF-8");
                }
            %>
            <div class="jumbotron-fluid align-content-lg-center alert-info">
                <br>

                <!--formulario para hacer la búsqueda de empleados -->
                <form id="FrmBuscPensioEmp" class="form-inline my-2 my-lg-0 col-lg-12 justify-content-center" action="Pensiones.jsp" method="post">
                    <input name="txtPensionIdEmp" id="txtPensionIdEmp" placeholder="N° de Identificación" value="<%=valor1%>" class=" form-control mr-sm-2" type="text" required readonly>
                    <input name="txtPensionNom" id="txtPensionNom" placeholder="Empleado" value="<%=valor2%>" class=" form-control mr-ms-2 col-md-5" type="text" required readonly>&nbsp;&nbsp;
                    <button id="btnCargarDialodPension" class="btn btn-outline-success my-2 my-sm-0" type="button">Buscar Empleado</button> 

                </form>
                <br>
            </div> 


            <div class="col-lg-12 align-content-lg-center my-lg-5 ">
                <div class="panel panel-warning col-lg-10 container-fluid">
                    <div class="panel-heading pa col-lg-8 align-content-center">Pensiones Asignadas a:<strong> <%=valor2%></strong></div>
                    <div class="panel-body col-lg-12 my-lg-3" >
                        <table id="tblBPensiones" class="table table-responsive-lg tblS col-lg-10" >
                            <thead class="cabTabla ">
                                <tr>
                                    <th hidden> Código</th>   
                                    <th hidden>Identificación</th>
                                    <th>Monto</th>
                                    <th>Fecha Rige</th>
                                    <th>&nbsp;&nbsp;&nbsp;</th> 
                                </tr>
                            </thead>
                            <tbody class="panel-body col-lg-8">
                                <%
                                    /*se crea la instancia de logica de puestos y una variable ResultSet
                                    para obtener la lista de puestos que estan registrados en la tabla */

                                    ClsLgPensiones LgPension = new ClsLgPensiones();
                                    ClsEmpleado vlo_Emp = new ClsEmpleado();
                                    ResultSet vlo_RS;
                                    String vlc_Sentencia = String.format("ID_EMPLEADO = '%s'", Id);
                                    vlo_RS = LgPension.ListarRegistro(vlc_Sentencia);
                                    while (vlo_RS.next()) {
                                %>   
                                <tr>
                                    <%int Cod = vlo_RS.getInt("COD_PENSION");
                                        String IdEmpl = vlo_RS.getString("ID_EMPLEADO");
                                        double Montopension = vlo_RS.getDouble("MONTO");
                                        Date fecha = vlo_RS.getDate("FECHA_RIGE");
                                    %>
                                    <td hidden><%=Cod%></td>
                                    <td hidden><%=IdEmpl%></td>
                                    <td><%=Montopension%></td>
                                    <td><%=fecha%></td>
                                    <td>
                                        <a onclick="CargarFormPension('<%=valor1%>', '<%=valor2%>', '<%=Cod%>', '<%=Montopension%>', '<%=fecha%>')"><img src="images/editar.png"/></a>&nbsp;&nbsp;
                                        <a href="EliminarPension?codP=<%=Cod%>&idEmp=<%=IdEmpl%>"><img src="images/basura.png"/></a></td>                        
                                    <!--El onclick llama una función de jscript para copiar estos valores en el campo de texto correspondiente -->
                                </tr> 
                                <%}%>
                            </tbody>
                        </table>
                        <div class="col-lg-12 align-content-lg-center my-lg-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%
                                Date hoy = new Date();
                                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                String Fecha = formato.format(hoy);
                            %>
                            <input type="button" id="btnNuevaPension"name="btnNuevoPrest" class="btn btn-primary" onclick="CargarFormPension('<%=valor1%>', '<%=valor2%>', '<%=-1%>', '<%=""%>','<%=Fecha%>')" value=" Agregar Pension" />&nbsp;&nbsp;
                            <input type="button" id="btnSalir" class="btn btn-primary" onclick="location.href = 'index.html'" value=" Atrás" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--***********************************************************************************************************************************************-->
        <!-- Aquí va ir el formulario para agregar y modificar los registros de pensión
            este formulario sera un dialogo oculto que se mostrara al presionar
        un botón -->

        <div id="DialogFormPension" class="form-group col-lg-12" title="Registro de Pensiones">

            <form class="form-control-ms col-lg-12" action="GuardarPension" method="post">
                <div class="form-row col-lg-12">

                    <div id="" class="col-lg-4">
                        <label for="txtIdEmp">N° Identificación:</label><br>
                        <input type="text" id="txtIdEmp" class="col-lg-12" name="txtIdEmp"required readonly="">
                    </div>
                    <div id="" class="col-lg-3">
                        <label for="txtCodigoPension" hidden>Código:</label><br>
                        <input type="text" hidden="" id="txtCodigoPension" class="col-lg-12" name="txtCodigoPension" required>
                    </div>

                    <div id="" class="col-lg-5 my-2">
                        <label for="txtFecha"></label>Fecha:<br>
                        <input type="text" id="txtFecha" class="col-lg-9" name="txtFecha" value="">
                    </div> 
                </div>    
                <div id="" class="col-lg-12">
                    <label for="txtNombEmp">Empleado:</label><br>
                    <input type="text" id="txtNombEmp" class="col-lg-12" name="txtNombEmp" readonly="">
                </div>
                <div class="form-row col-lg-12">
                    <div id="" class="col-lg-6 my-2">
                        <label for="txtMonto">Monto:</label><br>
                        <input type="number" id="txtMonto" name="txtMonto" class="col-lg-12"required>
                    </div>
                </div>
                <br>
                <div id="" class="form-row col-lg-12 ">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Guardar" class="btn btn-outline-primary col-md-5">&nbsp;
                    <input id="salirFormPensiones" type="button" onclick="" value="Salir" class="btn btn-outline-info col-md-5">
                </div>
            </form>
        </div>




        <!--***************************************************************************************************************** -->

        <!--con este div muestro el mensaje si al presionar el botón guardar hay campos incompletos-->
        <div class="ui-widget" id="MsFormIncompleto" title="Mensaje De herror">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                    <strong>Alerta:</strong> <p id="msjP"></p> </p>
            </div>
        </div>
        <!-- ***************************************************************************************************************** -->


        <%
           

            if (request.getParameter("msj")!=null) {
                 String m = URLDecoder.decode(request.getParameter("msj"), "UTF-8");
        %>
        <div class="ui-widget" id="ErrorGPension" title="Mensaje">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                    <strong>Alerta:</strong> <p id="Msj"></p><%=m%>; </p>
            </div>
        </div>
        <%
            }
        %>

        <!--***********************************************************************************************************************************************-->
        <!--Dialogo que contiene la tabla de empleados donde puedo seleccionar uno de ellos para que se coloque la informacion en 
            el formulario de busqueda y asi motrar los prestamos asignados a cada empleado y no una tabla de prestamos en general -->

        <div  id="DialodPension" title="Buscar Empleados">

            <table id="tblEmpleados" class="table table-responsive tblC  col-md-12" ><!--Inicio de la tabla empleados -->
                <thead class="tblh">
                    <tr>
                        <!--Crear columnas-->
                        <th>Identificación No.</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Puesto</th>
                        <th>Grado académico</th>
                        <th>&nbsp;&nbsp;</th>
                </thead>
                <tbody>
                    <!--función para cargar la tabla de empleados-->
                    <%
                        ResultSet vlo_RSet;
                        ClsLgEmpleado vloEmp = new ClsLgEmpleado();
                        ClsPuestos vloPuest;
                        ClsLgPuesto vlo_LgPuest = new ClsLgPuesto();

                        vlo_RS = vloEmp.ListarRegistro("");
                        while (vlo_RS.next()) {
                            vloPuest = vlo_LgPuest.ObtenerRegistro("COD_PUESTO=" + vlo_RS.getInt("COD_PUESTO"));
                    %>   
                    <tr>
                        <%
                            String cod = URLDecoder.decode(vlo_RS.getString("ID_EMPLEADO"), "UTF-8");
                            String Nombre = URLDecoder.decode(vlo_RS.getString("NOMBRE"), "UTF-8");
                        %>
                        <td><%=cod%></td>
                        <td><%=Nombre%></td>
                        <td><%=vlo_RS.getString("TELEFONO")%></td>
                        <td><%=URLDecoder.decode(vloPuest.getNombrePuesto(), "UTF-8")%></td>
                        <td><%=URLDecoder.decode(vlo_RS.getString("GRADO_ACADEMICO"), "UTF-8")%></td>
                        <td><a href="#" onclick="seleccionarRegistroEmpPension('<%=cod%>', '<%=Nombre%>')" class="" title="Seleccionar"><img src="images/iconfinder_Select_46755.png" /></a></td>  
                    </tr> 
                    <%}%>
                </tbody>
            </table> 
        </div>                      

        <!--Escrips-->
        <script src="JS/bootstrap.min.js" type="text/javascript"></script>
        <script src="JS/jquery-ui.min.js" type="text/javascript"></script>
        <script src="JS/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="JS/Global.js" type="text/javascript"></script>
        
    </body>
   
</html>
