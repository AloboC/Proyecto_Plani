<%-- 
    Document   : DetallePlanilla
    Created on : 11-mar-2019, 11:11:11
    Author     : alobo
--%>

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
        <title>Detalles de Planilla</title>
    </head>
    <body>
        <div class="img"></div>
        <div>
            <h3 class="cab">Detalles Planilla</h3>

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
                        <a class="nav-link" href="Puestos.jsp?txtCodP=1">Puestos <span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a class="nav-link" href="RegistroPlanilla.jsp">Planillas <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>





        <section class="my-lg-5 col-lg-10 container-fluid align-content-center">
            <div class="form-group col-lg-12">
                <div class="form-row col-lg-12">
                    <div id="" class="form-inline col-lg-6">
                        <label for="" id="" class="" ><h5>Código de Planilla:&nbsp;&nbsp;</h5><h5 id="NPlanilla"></h5></label>
                    </div>
                    <div id="" class="form-inline col-lg-6">
                        <label for="" id="" class="col-lg-12"><h5>Fecha:&nbsp;&nbsp;</h5><h5 id="Fecha" class="col-lg-12"></h5> </label>

                    </div>
                </div><br><br>
                <div class="form-row col-lg-12">
                    <div id="" class="form-inline col-lg-5">
                        <label for="" id="" class="col-lg-12"><h5>Empleado:&nbsp;</h5><h5 id="NEmpleado" class="col-lg-11"></h5> </label>  
                    </div >
                    <div id="" class="form-inline col-lg-6">
                        <label for="" id="" class="col-lg-12"><h5>N° de Identificación:&nbsp;</h5><h5 id="Id" class="col-lg-7"></h5> </label>  
                    </div>
                </div>
            </div>

            <hr>
            <div class="container-fluid form-row">
                <div id="" class="col-lg-8 my-lg-3 container align-content-center form-group">
                    <h3>Tabla de deducciones y Pagos: </h3>
                    <table id="" class="table table-sm col-lg-6 align-content-center">
                        <thead>
                            <tr>
                                <th hidden="">Código Planilla</th>
                                <th hidden="">Fecha</th>
                                <th hidden="">Identificación</th>
                                <th hidden="">Nombre</th>
                                <th hidden="">Salario</th>
                                <th hidden="">Salario Bruto</th>
                                <th hidden="">Salario Neto</th>
                                <th hidden="">Pago Primer Quincena</th>
                                <th hidden="">Pago segunda Quincena</th>
                                <th class="col-sm-1">Concepto de </th>
                                <th class="col-sm-1">Monto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String anio = "", mes = "", CodPlan = "", IdEmp = "", vlc_Sentencia = "";
                                int codP = 0;
                                if (request.getParameter("id") != null && request.getParameter("codP") != null && request.getParameter("Ao") != null && request.getParameter("ms") != null) {
                                    anio = URLDecoder.decode(request.getParameter("Ao"), "UTF-8");
                                    mes = URLDecoder.decode(request.getParameter("ms"), "UTF-8");
                                    CodPlan = URLDecoder.decode(request.getParameter("codP"), "UTF-8");
                                    IdEmp = URLDecoder.decode(request.getParameter("id"), "UTF-8");

                                    ResultSet vlo_Rs;
                                    ClsLgPlanilla vlo_LgPlanilla = new ClsLgPlanilla();
                                    vlc_Sentencia = String.format("PLANILLAS.COD_PLANILLA= %s AND EMPLEADOS.ID_EMPLEADO ='%s'", CodPlan, IdEmp);
                                    vlo_Rs = vlo_LgPlanilla.ListarRegistros(vlc_Sentencia, 2);

                                    while (vlo_Rs.next()) {
                            %>
                            <tr>
                                <td hidden=""><input id="tcPlanilla" name="tcPlanilla" type="" value="<%=vlo_Rs.getInt("COD_PLANILLA")%>"/></td>
                                <td hidden=""><input id="tFecha" name="tFecha" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("FECHA"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tId" name="tId" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("ID_EMPLEADO"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tNombre" name="tNombre" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("EMPLEADO"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tSalario" name="tSalario" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("SALARIO"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tSalarioBru" name="tSalarioBru" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("SALARIO_BRUTO"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tSalarioN" name="tSalarioN" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("SALARIO_NETO"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tQ1" name="tQ1" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("QUINCENA_1"), "UTF-8")%>"/></td>
                                <td hidden=""><input id="tQ2" name="tQ2" type="" value="<%=URLDecoder.decode(vlo_Rs.getString("QUINCENA_2"), "UTF-8")%>"/></td>
                                <td><%=URLDecoder.decode(vlo_Rs.getString("DESCRIPCION"), "UTF-8")%></td>
                                <td><%=URLDecoder.decode(vlo_Rs.getString("MONTO"), "UTF-8")%></td>
                            </tr>
                            <%}
                        } else {%>
                        <div class="container">
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error !</strong><%="No hay registros para este empleado"%>
                            </div>
                        </div>

                        <% }%>
                        </tbody>
                    </table>
                </div>
                               
                <div class="col-lg-4 my-lg-2">
                    <h3 class="col-lg-12">Montos Salariales</h3>
                    <hr><br>
                    <div class="form-row col-lg-12">
                        <div id="" class="form-inline col-lg-12">
                            <h5 class="col-lg-6">Salario Base:&nbsp;&nbsp;</h5><br>
                            <h5 class="col-lg-6" id="sBase"></h5>
                        </div>
                        <div id="" class="form-inline col-lg-12">
                            <h5 id="" class="col-lg-6">Salario Bruto:&nbsp;&nbsp;</h5><h5 id="sBruto" class="col-lg-6"></h5>
                        </div>
                        <div id="" class="form-inline col-lg-12">
                            <h5 class="col-lg-6">Salario Neto:&nbsp;</h5><h5 id="sNeto" class="col-lg-6"></h5> 
                        </div >
                    </div><br><br>
                    <div class="form-row col-lg-12">
                        
                        <div id="" class="form-inline col-lg-12">
                            <h5 class="col-lg-6">Adelanto Quincenal:&nbsp;</h5><h5 id="Q1" class="col-lg-6"></h5> 
                        </div>
                        <div id="" class="form-inline col-lg-12">
                            <h5 class="col-lg-6">Segunda Quincena:&nbsp;</h5><h5 id="Q2" class="col-lg-6"></h5> 
                        </div>
                    </div>
                </div>     





            </div>        
        </section>       




        <script src="JS/bootstrap.min.js" type="text/javascript"></script>
        <script src="JS/jquery-ui.min.js" type="text/javascript"></script>
        <script src="JS/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="JS/Global.js" type="text/javascript"></script>
    </body>
</html>
