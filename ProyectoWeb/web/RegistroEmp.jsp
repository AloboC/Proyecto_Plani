<%-- 
    Document   : RegistroEmp
    Created on : 06-mar-2019, 17:50:06
    Author     : alobo
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entidades.*"%>
<%@page import="Logica.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

        <title>Registro de empleados</title>
    </head>
    <body>
        <div class="img"></div>
        <div>
            <%
                /*Se instancia la entidad empleados para obtener los empleados */
                ClsLgEmpleado vlo_LgEmp;
                ClsEmpleado vlo_Emp = new ClsEmpleado();
                /*obtener la fecha actual y que esta en formato Date de java.util.Date
                   y pasarla a formato java.util.Date*/
                java.util.Date fecha = new Date();
                // La fecha actual se le inserta a la entidad Empleado
                vlo_Emp.setFechaInicio(fecha);

                String n_Id = "";

                /*Si el id que recibe no es un -1 es porque se va a hacer una actualizacion por lo tanto
                  se obtiene la entidad para mostrarla en los campos de texto 
                  si es un -1 no se hace nada ya que la instancia se creo anteriormente con sus valores 
                  iniciales */
                if (!request.getParameter("id").equals("-1")) {
                    /*se obtiene el registro del empleado para poner en sus diferentes campos de texto
                     la información del mismo                    
                     */
                    n_Id = request.getParameter("id");
                    vlo_LgEmp = new ClsLgEmpleado();
                    vlo_Emp = vlo_LgEmp.ObtenerRegistro(n_Id);
                }
            %><%
                /*Dependiendo del id que traiga el Query mostrara el titulo de la pagina */
                if (vlo_Emp.getId() == "") {
            %>
            <h3 class="cab">Registrar Empleado</h3>
            <%
            } else {
            %>
            <h3 class="cab">Actualizar Registro de Empleado</h3>            
            <%
                }
            %>

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
                        <a class="nav-link" href="RegistroPlanilla.jsp">Planillas <span class="sr-only">(current)</span></a>
                    </li>       
                </ul>

            </div>
        </nav><!-- ***************************************************************************************Barra Navegador-->

        <section class="container-fluid my-4">    
            <div class="container">
                <form id="f1" name="f1" action="GuardarEmp" method="post">
                    <div class="form-group col-md-12">
                        <div class="form-group col-md-2">
                            <label for="txtId">Identificación No.</label>
                            <%
                                /*Dependiendo del id que traiga el Query mostrara el titulo de la pagina */
                                if (vlo_Emp.getId() == "") {
                            %>
                            <input type="text" class="form-control" id="txtId" name="txtId" maxlength="15" value="<%=vlo_Emp.getId()%>" required="required">
                            <%
                            } else {
                            %>
                            <input type="text" class="form-control" id="txtId" maxlength="15" name="txtId" value="<%=vlo_Emp.getId()%>" readonly>
                            <%
                                }
                            %>                            
                        </div>
                    </div>
                    <div class="form-row col-md-12">  
                        <div class="form-group col-md-4">
                            <label for="txtNom">Nombre:</label>
                            <input type="text" class="form-control" id="txtNom" name="txtNom" maxlength="30" value="<%=URLDecoder.decode(vlo_Emp.getNombre(),"UTF-8") %>" required="required">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="txtApe1">Primer Apellido:</label>
                            <input type="text" class="form-control" id="txtApe1" name="txtApe1" maxlength="30" value="<%=vlo_Emp.getApellido_1()%>" required="required">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="txtApe2">Segundo Apellido</label>
                            <input type="text" class="form-control" id="txtApe2" name="txtApe2" maxlength="30" value="<%=URLDecoder.decode(vlo_Emp.getApellido_2(),"UTF-8")%>">
                        </div>
                    </div>
                    <!--Segunda Fila -->
                    <div class="form-row col-md-12">  
                        <div class="form-group col-md-4">

                            <label for="cboGrado">Grado Académico:</label>
                            <select  id="cboGrado" o name="cboGrado" class="form-control col-lg-12"required="required" onchange="Sleleccionar()">
                                <option value="">Seleccione su grado académico</option>
                                <option value="Diplomado">Diplomado</option>
                                <option value="Técnico">Técnico</option>
                                <option value="Bachillerato">Bachillerato</option>
                                <option value="Licenciatura">Licenciatura</option>
                                <option value="Maestría">Maestría</option>
                                <option value="Doctorado">Doctorado</option>

                            </select>

                        </div>

                        <div class="form-group col-md-4">
                            <label for="txtTel">Teléfono:</label>
                            <input type="number" class="form-control" id="txtTel" name="txtTel" maxlength="8" value="<%= vlo_Emp.getTelefono()%>" required="required">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="txtCorreo">Correo:</label>
                            <input type="text" class="form-control" id="txtCorreo" name="txtCorreo" maxlength="40" value="<%=URLDecoder.decode(vlo_Emp.getCorreo(),"UTF-8")%>">
                        </div>

                    </div>
                    <!--Tercera Fila -->
                    <div class="form-row col-md-12">  
                        <div class="form-inline col-md-4">
                            <label for="txtFecha" class="col-lg-6 justify-content-lg-start">Fecha de Ingreso</label>
                            <%
                                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                String fechaStr = formato.format(vlo_Emp.getFechaInicio());
                                /*Date f=null;
                                   f = formato.parse(fechaStr);
                                   java.sql.Date fsql=new java.sql.Date(f.getTime());
                                   out.print(fsql);*/

                            %>
                            <input type="text" class="form-control mr-sm-1 col-md-10" id="txtFecha" name="txtFecha" value="<%=fechaStr%>" readonly>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="txtPuesto" class="col-md-8">Puesto Asignado:</label>
                            <div class="input-group col-md-12">
                                <%
                                    /*Se instancia la Entidad de puestos para obtener el nombre del puesto*/
                                    ClsLgPuesto vlo_LgP;
                                    ClsPuestos vlo_Puesto = new ClsPuestos();
                                    /* se obtiene el registro de puestos para obtener el nombre del mismo */
                                    vlo_LgP = new ClsLgPuesto();
                                    String vlc_Condicion = String.format("COD_PUESTO = %s", vlo_Emp.getCodigoPuesto());
                                    vlo_Puesto = vlo_LgP.ObtenerRegistro(vlc_Condicion);
                                %>
                                <input class="form-control mr-sm-2 " type="search" id="txtPuesto" name="txtPuesto" value="<%= vlo_Puesto.getNombrePuesto()%>" readonly="">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="button" title="Buscar Puestos de Trabajo" name="btnBuscarPuesto" id="btnBuscarPuesto" onclick="" >Buscar</button>

                            </div>
                        </div>                        
                    </div>
                    <!--Cuarta fila-->
                    <div class="form-row col-md-6"> 
                        <div class="form-group col-md-4">
                            <!--Campos ocultos para manejar algunos valores necesarios para la acción de guardar y modificar-->
                            <input type="hidden" class="form-control" id="txtCodPOculto" name="txtCodPOculto" value="<%=vlo_Emp.getCodigoPuesto()%>">
                            <input type="hidden" class="form-control" required data-readonly id="txtGoculto" name="txtGoculto" value="<%=vlo_Emp.getGradoAcademico()%>">
                            <!--Este campo txtCategoria guarda la categoría del puesto-->
                            <input type="hidden" class="form-control" required data-readonly id="txtCategoria" name="txtCategoria" value="<%=""%>">

                        </div>             
                    </div>
                    <div class="form-row col-lg-7">
                        <div class="form-inline col-lg-12">
                            <button id="btnGuardar" type="button" onclick="EjecutarSubmit()" class="btn btn-outline-primary">Guardar</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-outline-warning">Restablecer</button>&nbsp;&nbsp;
                            <button type="button" class="btn btn-outline-info" onclick="location = 'Empleados.jsp'"> Atrás </button>&nbsp;&nbsp;
                            
                        </div>  
                    </div>
            </div>                 
        </form> 
    </div>

</section>
<!-- ***************************************************************************************************** -->


<!--Tabla para mostrar los titulos que tiene asignado cada empleado-->
<section class="container   col-lg-12" id="ContenedorTitulos">
    <div id="contenedorTitulos" class="col-lg-10 modal-footer " role="document"  title="">
        <table id="tblBuscarTitulos" class="table table-responsive-md col-10 " >
            <thead class="alert-info">
                <tr class="align-content-xl-center">
                   
                    <th hidden=""> Código</th>
                    <th>Titulo</th>
                    <th>Institución</th>
                    <th style="text-align: center">
                        Acciones
                    </th>

                </tr>
            </thead>
            <tbody>
                <%
                    /*se crea la instancia de logica de puestos y una variable ResultSet
                    para obtener la lista de puestos que estan registrados en la tabla */
                    ClsLgTitulos vloLgT = new ClsLgTitulos();
                    ResultSet Rs;
                     
                   String idEmpleado=vlo_Emp.getId();
                   String NombreEmp=String.format("%s %s %s",URLDecoder.decode(vlo_Emp.getNombre(),"UTF-8") ,URLDecoder.decode(vlo_Emp.getApellido_1(),"UTF-8"),URLDecoder.decode(vlo_Emp.getApellido_2(),"UTF-8") );
                   
                   String Sentencia = String.format("ID_EMPLEADO = '%s'", idEmpleado);
                    Rs = vloLgT.ListarRegistro(Sentencia);
                    while (Rs.next()) {
                %>   
                <tr>
                    <%int Cod = Rs.getInt(1);
                      String NomT=URLDecoder.decode( Rs.getString(2),"UTF-8");
                      String InsT=URLDecoder.decode( Rs.getString(3),"UTF-8");

                    %>
                    <td hidden=""><%=Cod%></td>
                    <td ><%=NomT%></td>
                    <td><%=InsT%></td>
                    <td style="text-align: center">
                        <a href="#" class="" aria-hidden="true" title="Actualizar"><img src="images/editar.png" onclick="RegistrarTitulo('<%=idEmpleado%>', '<%=NombreEmp%>', '<%=Cod%>', '<%=NomT%>', '<%=InsT%>');"/></a> 
                    <a href="DesasignarTitulo?id=<%=idEmpleado%>&CodT=<%=Cod%>" class="" aria-hidden="true" title="Quitar"><img src="images/basura.png"/></a> 
                    </td>                        
                    
                </tr> 
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td hidden="" style="text-align: center"></td>
                    <td style="text-align: center"></td>
                    <td style="text-align: center"></td>
                    <td style="text-align: center">
                        <button id="aTitulos" type="button" class="btn btn-outline-success" onclick="RegistrarTitulo('<%=idEmpleado%>' ,'<%=NombreEmp%>' ,'<%=-1%>' ,'<%=""%>','<%=""%>');" > Agregar Títulos </button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</section>
 



<!--Formulario para asignar títulos a un empleado-->

<div id="dialogTitulos" class="container col-md-12" title="Registro de Tilos Academicos">
    
    <form action="AsignarTitulo" method="post" class=" col-md-12 col-md-auto">
        <div  class="form-inline">
            <input class="form-control  col-md-3" hidden="" id="txtCodEmp" name="txtCodEmp" value="" placeholder="Cod Emp"/> 
            <input class="form-control  col-md-3" hidden="" id="txtCodTit" name="txtCodTit" value="" placeholder="Cod Tit"/>          

        </div>
        <div  class="form-group">
            <label for="txtEm">Empleado:</label><br>
            <input class="form-control  col-md-12" id="txtEm" name="txtEm" value="" readonly=""/>          
        </div>
          <div  class="form-group">
            <label for="txtTitulo">Titulo:</label><br>
            <input class="form-control col-md-12" id="txtTitulo" maxlength="50" name="txtTitulo" value="" required/>          
        </div>
          <div  class="form-group">
              <label for="txtInst" class="form-group">Institución</label><br>
              <input class="form-control col-md-12" id="txtInst" maxlength="50" name="txtInst" value="" required/>          
        </div>
         <div  class="form-group">
              
             <input type="submit" class="btn btn-outline-primary  col-md-4" value="Guardar" id="btnGuard" name="txtEm"/>&nbsp;&nbsp;     
             <input type="button" class="btn btn-outline-primary  col-md-3" value="Salir" id="btnSalir" name="txtEm"/>       
        </div>     
    </form>

</div>





    <!--***************************************************************************************************************** -->
   
    <!--con este div muestro el mensaje si al presionar el botón guardar hay campos incompletos-->
    <div class="ui-widget" id="msj" title="Mensaje De herror">
        <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
            <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                <strong>Alerta:</strong> <p id="ms"></p> </p>
        </div>
    </div>
                         
    <!-- ***************************************************************************************************************** -->


    
    
    
    
    
    
    


    <!--tabla de búsqueda de puestos-->

    <div id="dialog" title="Buscar Puestos de trabajo">
        <table id="tblBuscarPuestos" class="tblC table table-responsive display  col-lg-auto" >
            <thead>
                <tr>
                    <th> Código</th>
                    <th>Puesto</th>
                    <th>Categoría</th>
                    <th>Salario</th>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <%
                    /*se crea la instancia de logica de puestos y una variable ResultSet
                    para obtener la lista de puestos que estan registrados en la tabla */
                    ClsLgPuesto vloLgP = new ClsLgPuesto();
                    ResultSet vlo_Rs;
                    vlo_Rs = vloLgP.ListarRegistro("");
                    while (vlo_Rs.next()) {
                %>   
                <tr>
                    <%int Cod = vlo_Rs.getInt("COD_PUESTO");
                      String nombre =URLDecoder.decode(vlo_Rs.getString("NOMBRE_PUESTO"),"UTF-8") ;
                      int categoria=vlo_Rs.getInt("CATEGORIA");
                    %>
                    <td ><%=Cod%></td>
                    <td><%=nombre%></td>
                    <td><%=categoria%></td>
                    <td><%=vlo_Rs.getDouble("SALARIO")%></td>
                    <td><a href="#" onclick="SeleccionarPuesto('<%=Cod%>', '<%=nombre%>','<%=categoria%>')" class="" aria-hidden="true" title="Seleccionar"><img src="images/iconfinder_Select_46755.png"/></a></td>                           
                    <!--El onclick llama una función de jscript para copiar estos valores en el campo de texto correspondiente -->
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
