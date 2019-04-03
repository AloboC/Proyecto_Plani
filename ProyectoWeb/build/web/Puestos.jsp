<%-- 
    Document   : Puestos
    Created on : 09-mar-2019, 14:55:32
    Author     : alobo
--%>


<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Logica.ClsLgPuesto"%>
<%@page import="Entidades.ClsPuestos"%>
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
        <title>Registro de Puestos de trabajo</title>
    </head>
    <body>
        <div class="img"></div>
        <div class="cab">
            <h3>Registro de Puestos de Trabajo</h3>

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
                        <a class="nav-link" href="#">Puestos <span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a class="nav-link" href="RegistroPlanilla.jsp">Planillas <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>


        <section class="container-fluid my-lg-5 col-lg-12">
            <div class="jumbotron-fluid align-content-lg-center alert-info my-lg-5">
                <br>
                <!--formulario para hacer la búsqueda de Puestos -->
                <form class="form-inline my-2 my-lg-0 col-lg-12 justify-content-center" action="Puestos.jsp" method="post">

                    <input name="txtBuscar" id="txtBusNom"  class=" form-control mr-ms-2 col-md-5" type="search" placeholder="Puesto" aria-label="Puesto">&nbsp;&nbsp;
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-outline-primary my-2 my-sm-0" onclick="AbrirFormPuesto('<%=-1%>','<%=""%>','<%=0%>','<%=0%>')"> Nuevo Registro</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-outline-primary my-2 my-sm-0" onclick="location.href = 'index.html'"> Atrás</button>
                </form>
                <br>
            </div>



            <div class="col-lg-12 align-content-center">
                <table class="tbl table table-responsive display  col-lg-10 " >
                    <thead class="col-lg-12 cabTabla">
                        <tr >
                            <th class="col-ms-1"> Código</th>
                            <th class="col-md-2">Puesto</th>
                            <th>Categoría</th>
                            <th>Salario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            /*se crea la instancia de logica de puestos y una variable ResultSet
                            para obtener la lista de puestos que estan registrados en la tabla */
                            ClsLgPuesto vloLgP = new ClsLgPuesto();
                            ResultSet vlo_Rs;
                            String sentencia = "";
                            String nom = "";
                            //Pregunto si lo que trae el request esta null o vacio si no esta nulo ni vacio construllo 
                            //la sentencia de lo contrario la sentencia quedara vacia 
                            if (request.getParameter("txtBuscar") != null && request.getParameter("txtBuscar") != "") {
                                nom = URLEncoder.encode(request.getParameter("txtBuscar"), "ISO-8859-1");
                                sentencia = String.format("NOMBRE_PUESTO LIKE '%s'", "%" + nom + "%");
                            }

                            vlo_Rs = vloLgP.ListarRegistro(sentencia);
                            while (vlo_Rs.next()) {
                        %>   
                        <tr>
                            <%int Cod = vlo_Rs.getInt("COD_PUESTO");
                                String nombre =URLDecoder.decode(vlo_Rs.getString("NOMBRE_PUESTO"), "UTF-8");
                                int categoria = vlo_Rs.getInt("CATEGORIA");
                                double salario=vlo_Rs.getDouble("SALARIO");
                            %>
                            <td ><%=Cod%></td>
                            <td><%=nombre%></td>
                            <td><%=categoria%></td>
                            <td><%=salario%></td>
                            <td>
                                <a href="#" onclick="AbrirFormPuesto('<%=Cod%>','<%=nombre%>','<%=categoria%>','<%=salario%>')"><img src="images/iconfinder_Pencil_51713.png"/></a>
                                <a href="EliminarPuesto?id=<%=Cod%>"><img src="images/basura.png"/></a>
                            </td>                           
                            <!--El onclick llama una función de jscript para copiar estos valores en el campo de texto correspondiente -->
                        </tr> 
                        <%}%>
                    </tbody>
                </table>
            </div> 
        </section>

                    
                    
                    
        <section>
            <div id="FormRegPuesto" class="form-group col-lg-12" title="Registro  Puestos de Trabajo">
               
                <form  id="FrmPuestos" class="form-control-ms col-lg-12" action="GuardarPuestos" method="post">
                   
                    <div class="form-row col-lg-12">
                        <div id="" class="col-lg-4">
                            <label id="coP" for="txtCodP">Código Puesto:</label><br>
                            <input type="text" id="txtCodP" class="col-lg-12" name="txtCodP" value="" required>
                        </div>
                    </div>    
                    <div id="" class="col-lg-12 my-2">
                        <label for="txtNombP">Nombre del Puesto:</label><br>
                        <input type="text" id="txtNombP" class="col-lg-12" maxlength="40"  name="txtNombP" required="">
                    </div>
                    <div class="form-row col-lg-12">
                        <div id="" class="col-lg-6 my-2">
                            <label for="cboCategoria">Categoría:</label><br>
                            <select  id="cboCategoria" o name="cboCategoria" class="form-control-sm col-lg-12" value=""  required="required">
                                <option value="" selected="selected">Seleccione la categoría</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                        </div>
                        <div id="" class="col-lg-6 my-2">
                            <label for="txtMensualidad">Salario:</label><br>
                            <input type="number" id="txtSalario" name="txtSalario" class="col-lg-12"  required="required">
                        </div>
                    </div>
                    <br>
                    <div id="" class="form-row col-lg-12 ">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button"  value="Guardar" onclick="validarFormPuestos()" class="btn btn-outline-primary col-md-5">&nbsp;
                        <input id="salirFormPuestos" type="button" onclick="" value="Salir" class="btn btn-outline-info col-md-5">
                    </div>
                </form>
            </div>
        </section>           

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
             <!--***************************************************************************************************************** -->

        <!--con este div muestro el mensaje si al presionar el botón guardar hay campos incompletos-->
        <div class="ui-widget" id="msPuestos" title="Mensaje De herror">
            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                    <strong>Alerta:</strong> <p id="msP"></p> </p>
            </div>
        </div>
        <!-- ***************************************************************************************************************** -->
           
                    
                    
                    
                    
        <!--Escrips-->
        <script src="JS/bootstrap.min.js" type="text/javascript"></script>
        <script src="JS/jquery-ui.min.js" type="text/javascript"></script>
        <script src="JS/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="JS/Global.js" type="text/javascript"></script>
    </body>
</html>
