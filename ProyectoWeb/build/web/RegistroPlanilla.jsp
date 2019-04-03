<%-- 
    Document   : RegistroPlanilla
    Created on : 10-mar-2019, 21:11:27
    Author     : alobo
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.ClsLgPlanilla"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="JS/jquery.js" type="text/javascript"></script>
        <link href="CSS/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Global.css" rel="stylesheet" type="text/css"/>
        
    </head>

    <body>
        <div class="img"></div>
        <div class="cab">
            <h3>Generar Planilla</h3>

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
        </nav>
        <!--Menú para hacer la búsqueda de las planillas -->
        <%
            String fc;
            String anio;
            int Ao;

            if (request.getParameter("cboMes") != null && request.getParameter("txtAnio") != null) {
                fc = request.getParameter("cboMes");
                anio = request.getParameter("txtAnio");
                Ao = Integer.parseInt(anio);
            } else {
                //se optiene el mes y año actual
                java.util.Date fecha = new Date();
                SimpleDateFormat formato = new SimpleDateFormat("MMMM", new Locale("es"));
                SimpleDateFormat format = new SimpleDateFormat("yyyy", new Locale("es"));
                fc = formato.format(fecha);
                anio = format.format(fecha);
                Ao = Integer.parseInt(anio);
            }
        %>
        <section class="container-fluid my-lg-2 col-lg-12 form-row">
            <div class="col-lg-12 alert-dark align-content-lg-center" style="padding-top: 25px">
                <form id="ManejoPlanilla" action="" method="post" class="form-row col-lg-12">
                    <div class="form-group col-lg-4">
                        <label for="cboMes">Mes:</label>
                        <select  id="cboMes" type="spinner" name="cboMes" value="<%=fc%>"  class="form-group form-control-sm col-lg-8 my-lg-2"required="required">&nbsp;&nbsp;
                            <option value=""selected="">Seleccione el mes</option>
                            <option value="Enero">Enero</option>
                            <option value="Febrero">Febrero</option>
                            <option value="Marzo">Marzo</option>
                            <option value="Abril">Abril</option>
                            <option value="Mayo">Mayo</option>
                            <option value="Junio">Junio</option>
                            <option value="Julio">Julio</option>
                            <option value="Agosto">Agosto</option>
                            <option value="Septiembre">Septiembre</option>
                            <option value="Octubre">Octubre</option>
                            <option value="Noviembre">Noviembre</option>
                            <option value="Diciembre">Diciembre</option>
                        </select>
                    </div>
                    <div class="form-group col-lg-3">
                        <label for="txtAnio">Año:</label>
                        <input type="spinner" id="txtAnio"  name="txtAnio" value="<%=Ao%>" class="form-control-sm col-lg-4 " required="">
                    </div>
                    <div class="col-lg-4">
                        <!--LOS DOS BOTONES SON DE TIPO "SUBMIT" Y CON JS LE CAMBIO LA ACCIÓN DEL FORMULARIO-->
                        <button type="submit" id="btnBuscarP" class="btn btn-primary form-control-sm col-md-2">Cargar</button>&nbsp;
                        <button type="submit" id="btnCalcular" name="btnCalcular" class="btn btn-primary form-control-sm col-md-4">Generar Planilla</button>&nbsp;
                        <button hidden="" id="btnExtraordinaria" name="btnExtraordinaria" class="btn btn-primary form-control-sm col-md-4">Extraordinaria</button>

                    </div>
                </form>
            </div>


            <div id="" class="col-lg-12 my-lg-3">

                <% if (request.getParameter("cboMes") != null && request.getParameter("txtAnio") != null) {
                       //MUESTRO EN PANTALLA UN TITULO CON EL MES Y EL AÑO DE LA PLANILLA%>
                <h3>Planilla de <%=request.getParameter("cboMes")%> del <%=request.getParameter("txtAnio")%> </h3>
                <%}%>
                <table id="" class="tblC tabla table-responsive-sm col-lg-12 display">
                    <thead class="cabTabla">
                        <tr>
                            <th hidden="">Código Planilla</th>
                            <th>N° Identificación</th>
                            <th>Nombre</th>
                            <th>Salario Bruto</th>
                            <th>Salario Neto</th>
                            <th>Pago Primer Quincena</th>
                            <th>Pago segunda Quincena</th>
                            <th>&nbsp;&nbsp;&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
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
                        %>
                        <tr>
                            <td hidden=""><%=codP%></td>
                            <td><%=id%></td>
                            <td><%=URLDecoder.decode(vlo_Rs.getString("EMPLEADO"), "UTF-8")%></td>
                            <td><%= vlo_Rs.getDouble("SALARIO_BRUTO")%></td>
                            <td><%=vlo_Rs.getDouble("SALARIO_NETO")%></td>
                            <td><%=vlo_Rs.getDouble("QUINCENA_1")%></td>
                            <td><%=vlo_Rs.getDouble("QUINCENA_2")%></td>
                            <td><a href="DetallePlanilla.jsp?codP=<%=codP%>&id=<%=id%>&Ao=<%=pvn_Annio%>&ms=<%=pvn_Mes%>" class="" title="ver detalle"><img src="images/iconfinder_visible_3855636.png" /></a></td>  

                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </section>
                    
                    
        <%
            /************************************************
             * Mensajes que se van a presentar segun lo que pase con el procedimiento
             */
            
            
            
            if (request.getParameter("Info") != null){
            String ms=URLDecoder.decode(request.getParameter("Info"),"UTF-8");
        %>

        <div class="container">
            <div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>información!</strong> <%=ms%>
            </div>
        </div>

        <%} else if (request.getParameter("Msj") != null) {
            String ms=URLDecoder.decode(request.getParameter("Msj"),"UTF-8");
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>Excelente !</strong> <%=ms%>
            </div>
        </div>

        <%} else if (request.getParameter("Error") != null) {
           String ms=URLDecoder.decode(request.getParameter("Error"),"UTF-8");
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>Error !</strong><%=ms%>
            </div>
        </div>
        <%}%>            


       
         <div class="ui-widget" id="DialogoPlanilla" title="Mensaje">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                    <strong>Alerta:</strong> <p id="msR"></p>Seleccione el mes.</p>
            </div>
        </div>
        


        <!--           
                   
       <div class="container">
 <div class="alert alert-success alert-dismissible">
   <button type="button" class="close" data-dismiss="alert">×</button>
   <strong>Success!</strong> This alert box could indicate a successful or positive action.
 </div>
</div>
                   
                   
                   
                   
        -->       



        <script src="JS/bootstrap.min.js" type="text/javascript"></script>
        <script src="JS/jquery-ui.min.js" type="text/javascript"></script>
        <script src="JS/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="JS/Global.js" type="text/javascript"></script>


    </body>
</html>
