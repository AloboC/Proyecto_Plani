


//************************************************************** USO GLOBAL ********************************************

/*******************************************************************************
 * 
 * TABLA SIN CAMPO DE BUSQUEDA 
   darle formato a las tablas sin  la funsionalidad de  busqueda 
 */

$(document).ready(function () {
    $('.tblS').dataTable({
        searching: false, paging: false, info: true,
        "lengthMenu": [[5, 15, 15, -1], [5, 10, 15, "Todos"]],
        "language": {
            "info": "",
            "infoEmpty": "",
            "zeroRecords": "No se encuentran registros"
//            "search": "Buscar",
//            "infoFiltered": "",
//            "lengthMenu": "Mostrar _MENU_ Registros",
//            "paginate": {
//                "first": "Primero",
//                "last": "Último",
//                "next": "Siguiente",
//                "previous": "Anterior"
//            }
        }
    });
});


/*******************************************************************************
 * 
 * @type type
 * TABLA SIN CAMPO DE BUSQUEDA 
darle formato a las tablas sin  la funsionalidad de  busqueda 
 */

$(document).ready(function () {
    $('.tbl').dataTable({
        searching: false, paging: true, info: true,
        "lengthMenu": [[5, 15, 15, -1], [5, 10, 15, "Todos"]],
        "language": {
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "No existen Registros disponibles",
            "zeroRecords": "No se encuentran registros",
            "search": "Buscar",
            "infoFiltered": "",
            "lengthMenu": "Mostrar _MENU_ Registros",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });
});




/*******************************************************************************
 * 
 * TABLA CON PAGINACION
darle formato a las tablas y drale la funsionalidad de paginacion y busqueda uso
la clase de la tabla en lugar de un id
 */

$(document).ready(function () {
    $('.tblC').dataTable({
        searching: true, paging: true, info: true,
        "lengthMenu": [[5, 15, 15, -1], [5, 10, 15, "Todos"]],
        "language": {
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "No existen Registros disponibles",
            "zeroRecords": "No se encuentran registros",
            "search": "Buscar",
            "infoFiltered": "",
            "lengthMenu": "Mostrar _MENU_ Registros",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });

});



/*******************************************************************************
 * 
 * @returns {undefined}
 * Le da formato de calendario a un campo de texto
 */

$(function () {
    $("#txtFecha").datepicker({
        showOn: "button",
        buttonImage: "images/ical_icon-icons.com_75269.ico",
        buttonImageOnly: true,
        dateFormat: "yy-mm-dd",
        buttonText: "Seleccione una fecha"
    });
});



/*******************************************************************************
 * 
 * @param {type} $
 * @returns {undefined}
 * Esta función cambia el idioma del date picker
 */

jQuery(function ($) {
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '&#x3c;Ant',
        nextText: 'Sig&#x3e;',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
        ],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
            'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
        ],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles', 'Jueves', 'Viernes', 'S&aacute;bado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mi&eacute;', 'Juv', 'Vie', 'S&aacute;b'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S&aacute;'],
        weekHeader: 'Sm',
        dateFormat: 'yy/mm/dd',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
});



//*********************************************************** EMPLEADOS *************************************************


/*******************************************************************************
 * 
 * @returns {undefined}
 * muestra el mensaje cuando se elimina un registro 
 */
$(function () {
    $("#dialogo").dialog();
});



/*******************************************************************************
 * 
 * @returns {undefined}
 * inicializar el dialog de clientes
 */

$(function () {
    $("#dialog").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });

    // Esta función solamente abre el div que contiene la tabla de puestos
    $("#btnBuscarPuesto").click(function () {
        $("#dialog").dialog("open");
    });
});



/*******************************************************************************
 * 
 * @returns {undefined}
 * 
 * inicializar el dialog de clientes
 */
$(function () {
    $("#dgMensaje").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });
});




/*******************************************************************************
 * 
 * @returns {undefined}
 * Esta funsion obtiene el valor que tienen los campos de texto del formulario 
 * de registrar cliente y verifica que no esten vacios 
   si no estan bacios ejecuta el submit del formulario de lo contrario muestra 
   un mensaje indicando que se deben de llenar 
  todos los campos para poder guardar el registro
 */
function EjecutarSubmit() {
    var id = $("#txtId").val();
    var nom = $("#txtNom").val();
    var ape1 = $("#txtApe1").val();
    var gra =  $('select[id="cboGrado"] option:selected').val();
    var codP = $("#txtCodPOculto").val();
    var tel = $("#txtTel").val();
    var cat=$("#txtCategoria").val();
    var msj = "";
    var msjResp="";
    var accion="";
    if (id !== "" && nom !== "" && ape1 !== "" && gra !== "" && codP !== "0" && tel !== "") {
        if((gra==="Diplomado" || gra==="Técnico")&& cat==="2" ){
          msj="Verifique el grado académico y el puesto de trabajo que eligió\n\
               ya que si no tiene un titulo universitario no puede asignársele\n\
               un puesto de categoría 2";
          msjResp=msj;
          accion=1;
        }else{
            //Ejecuta el submit del formulario
            $("#f1").submit();     
        }  
    } else {
        // muestra este texto en la etiqueta p de un dialogo 
        msj = "Por favor  verifique que todos los campos estén completos y que\n\
               haya seleccionado tanto su puesto de trabajo como\n\
               su grado académico";
        msjResp=msj;
        accion=2; 
    }
    if(accion!==""){
     $("#ms").text(msj);
        //Abre el dialogo 
     $("#msj").dialog("open");
    }
};



$(function () {
    $("#msj").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });

});




/*******************************************************************************
 * 
 * @returns {undefined}
 */
$(function () {
    $("#msEliminar").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });
    $("#msEliminar").dialog("open");
    
});




/*******************************************************************************
 * 
 * @param {type} Cod
 * @param {type} nombre
 * @param {type} categoria
 * @returns {undefined}
 * recibe como parametros el codigo y nombre del puesto y los asigna a los
 * campos correspondientes
 */
function SeleccionarPuesto(Cod,nombre,categoria) {
    $("#txtCodPOculto").val(Cod);
    $("#txtPuesto").val(nombre);
    $("#txtCategoria").val(categoria);

    $("#dialog").dialog("close");
    
};



/*******************************************************************************
 * 
 * Esta funsion es para que cuando cargue la pagina el select este seleccionando
 * el grado academico que trae la entidad
 */

$(document).ready(function(){
    var valor=$("#txtGoculto").val();
    $("#cboGrado").val($('#txtGoculto').val()).attr("selected",true);  
});


/*******************************************************************************
 * 
 * @returns {undefined}
 * Funsion que me ayuda a obtener el valor que se selecciono en el select y
 *  guarda ese valor en un campo de texto oculto
 */

function Sleleccionar(){
      var Opn= $('select[id="cboGrado"] option:selected').val();
      $("#txtGoculto").val(Opn);
  };


/*******************************************************************************
 * 
 * @returns {undefined}
 * inicializar el dialog con el formulario para
 * registrar los titulos academicos
 */

$(function () {
    $("#dialogTitulos").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 400
    });    
});



/*******************************************************************************
 * 
 * @param {type} idEmpleado
 * @param {type} NombreEmp
 * @param {type} cod
 * @param {type} NomT
 * @param {type} InsT
 * @returns {undefined}
 * Esta funcion llena los campos del formulario de registrar los titulos con
 *  datos que se elijen de la tabla  y abre el cuadro de  dialogo 
 * donde esta el formulario de de registro
 */
function RegistrarTitulo(idEmpleado,NombreEmp,cod,NomT,InsT){
      $("#txtCodEmp").val(idEmpleado);
      $("#txtCodTit").val(cod);
      $("#txtEm").val(NombreEmp);
      $("#txtTitulo").val(NomT);
      $("#txtInst").val(InsT);
      $("#dialogTitulos").dialog("open");      
};


/*******************************************************************************
 * 
 * esconde la tabla de titulos si lo que se va a hacer es un registro nuevo 
 * cuan el registro se hace muestra la tabla para 
   reggistrar los titulos
 */
$(document).ready(function(){
    var id=$("#txtId").val();
    if(id!=="-1" && id!=="0" && id!==""){
         $("#ContenedorTitulos").show();      
    }else{
          $("#ContenedorTitulos").hide();  
    }    
});


     
/**************************************************************** PRESTAMOS  *******************************************
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * @param {type} Id
 * @param {type} nomb
 * @param {type} coPres
 * @param {type} montoP
 * @param {type} cuota
 * @param {type} fecha
 * @returns {undefined}
 *  Si el parametro Id viene vacio muestra un mensaje indicando que debe
 *   seleccionar un empleado 
 * Sino viene vacio copia el id del empleado en el formulario de registro 
 * y abre el formulario 
 */
function CargarFormPrestamo(Id,nomb,coPres,montoP,cuota,fecha){
    
    if(Id===""){
        var m="Por favor seleccione al empleado que desea asignarle el prestamo";
        $("#msjP").text(m);
        $("#MsIncompleto").dialog("open");    
    }else{
        $("#txtIdEmp").val(Id);
        $("#txtCodigoPrest").val(coPres);
        $("#txtFecha").val(fecha);
        $("#txtMensualidad").val(cuota);
        $("#txtMontoPrest").val(montoP);
        $("#txtNombEmp").val(nomb);
        $("#DialogFormPrestamos").dialog("open");     
    }  
};

/*******************************************************************************
 * 
 * @param {type} cod
 * @param {type} Nombre
 * @returns {undefined}
 * inicializar el dialog de clientes para asignarles prestamos
 */
$(function () {
    $("#DialodPrestamo").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 1000
    });
    /************************************************************
     * Esta función solamente abre el div que contiene
     *  la tabla de puestos
     */
         $("#btnCargarDialodPrestamo").click(function () {
        $("#DialodPrestamo").dialog("open");
    }); 
});

/*******************************************************************************
 * 
 * @param {type} cod
 * @param {type} Nombre
 * @returns {undefined}
 * obtiene el codigo y nombre del empleado y los pegan en el formulario
 *  de busqueda 
 */
function seleccionarRegistroEmpPrest(cod, Nombre){
    $("#txtPrestIdEmp").val(cod);
    $("#txtPrestNom").val(Nombre);
    $("#DialodPrestamo").dialog("close");
    $("#FrmBuscPrestEmp").submit();
};


/*******************************************************************************
 * 
 * Funsion para cerrar el formulario de agregar prestamos
 */
    $("#salirFormPrestamos").click(function(){ 
        $("#DialogFormPrestamos").dialog("close") ;
    });
     

/*******************************************************************************
 * 
 * @returns {undefined}
 * inicializar el dialogo para mostrar el mensaje de lo que ocurre cuando
 *  guardo un prestamo
 */
$(function () {
    $("#ErrorGPres").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });
  
});


/*******************************************************************************
 * 
 * @returns {undefined}
 * muestra el mensaje cuando se elimina un registro 
 */
$(function () {
     $("#ErrorGPres").dialog("open");
});

//******************************************************************************
//inicializar el dialog de clientes

$(function () {
    $("#DialogFormPrestamos").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });

});



/*******************************************************************************
 * 
 * 
 * 
 * @returns {undefined}
 * Inicializa el cuadro de dialogo del registro de prestamos 
 * 
 **/
$(function () {
    $("#MsIncompleto").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    }); 
});





/************************************************************** PESIONES ******************************************************************************
 * 
 * 
 * 
 *  
 * @param {type} Id
 * @param {type} nomb
 * @param {type} coPens
 * @param {type} montoP
 * @param {type} fecha
 * @returns {undefined}
 *  Si el parametro Id viene vacio muestra un mensaje indicando que debe
 *   seleccionar un empleado 
 * Sino viene vacio copia el id del empleado en el formulario de registro
 *  y abre el formulario 
 */
    
 function CargarFormPension(Id,nomb,coPens,montoP,fecha){
    
    if(Id===""){
        var m="Por favor seleccione al empleado que desea asignarle la pemsión alimenticia";
        $("#msjP").text(m);
        $("#MsFormIncompleto").dialog("open");    
    }else{
        $("#txtIdEmp").val(Id);
        $("#txtCodigoPension").val(coPens);
        $("#txtFecha").val(fecha);
        $("#txtMonto").val(montoP);
        $("#txtNombEmp").val(nomb);
        $("#DialogFormPension").dialog("open");     
    }  
};    


/*******************************************************************************
 * 
 * @returns {undefined}
 * inicializar el dialog de clientes para poder elegir 1 y asignarle una pension 
 */ 
 
$(function () {
    $("#DialodPension").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 1000
    });
    /*************************************************************
     * Esta función solamente abre el div que contiene la tabla de puestos
     */
         $("#btnCargarDialodPension").click(function () {
        $("#DialodPension").dialog("open");
    }); 
});


/*******************************************************************************
 * 
 * @param {type} cod
 * @param {type} Nombre
 * @returns {undefined}
 * obtiene el codigo y nombre del empleado y los pegan en el formulario
 *  de busqueda 
 */
function seleccionarRegistroEmpPension(cod, Nombre){
    $("#txtPensionIdEmp").val(cod);
    $("#txtPensionNom").val(Nombre);
    $("#DialodPension").dialog("close");
    $("#FrmBuscPensioEmp").submit();
};

/*******************************************************************************
 * 
 * 
 * Funsion para cerrar el formulario de agregar prestamos
 */
    $("#salirFormPensiones").click(function(){ 
        $("#DialogFormPension").dialog("close") ;
    });
     

/*******************************************************************************
 * 
 * @returns {undefined}
 * inicializar el dialogo para mostrar el mensaje de lo que ocurre cuando
 *  guardo un prestamo
 */
$(function () {
    $("#ErrorGPension").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });
  
});


/*******************************************************************************
 * 
 * @returns {undefined}
 * muestra el mensaje cuando se elimina un registro 
 */
$(function () {
     $("#ErrorGPension").dialog("open");
});


//******************************************************************************
//inicializar el dialog de clientes

$(function () {
    $("#DialogFormPension").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });

});



/*******************************************************************************
 * 
 * @returns {undefined}
 * Inicializa el cuadro de dialogo del registro de prestamos 
 */
$(function () {
    $("#MsFormIncompleto").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    }); 
});




/********************************************************** Puestos de trabajo *****************************************
 * 
 * 
 * 
 */


/*******************************************************************************
 * 
 * @returns {undefined}
 * Inicializa el cuadro de dialogo del registro de prestamos 
 */
$(function () {
    $("#FormRegPuesto").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    }); 
});



/*******************************************************************************
 * 
 * @param {type} CodPuesto
 * @param {type} nombre
 * @param {type} categoria
 * @param {type} salario
 * @returns {undefined}
 * 
 * recibe los datos de la tabla de puestos y los envia al formulario de registro
 * si el registro es nuevo oculta el campo del codigo de puesto y
 * su respectivo label  
 */
function AbrirFormPuesto(CodPuesto,nombre,categoria,salario){
    $("#txtCodP").val(CodPuesto);
    $("#txtNombP").val(nombre);
     $("#cboCategoria option[value='"+categoria+"']").attr("selected", true);
    
    if (CodPuesto==="-1"){
        $("#txtSalario").val(""); 
        $("#txtCodP").hide();  
        $("#coP").hide();  
    }else{
        $("#txtSalario").val(salario); 
        $("#txtCodP").attr("readonly",true);   
    } 
$("#FormRegPuesto").dialog("open");
   
};

/*******************************************************************************
 * 
 * @returns {undefined}
 * obtiene los valores de los campos del formulario y comprueva que sean validos 
 *si son validos ejecuta el submit del formulario
 * 
 */
function validarFormPuestos(){
    var id=$("#txtCodP").val();
    var nombre=$("#txtNombP").val();
    var categoria=$('select[id="cboCategoria"] option:selected').val();               
    var salario=$("#txtSalario").val();
    
    if(id!=="" && nombre!=="" && categoria!=="" && salario>=250000){  
        $("#FrmPuestos").submit(); 
    }else{
        var m="Verifique que todos los campos estén completos y que el salario no sea menor a 250000 colones";
          $("#msP").text(m);
          $("#msPuestos").dialog("open"); 
    }
};


/*******************************************************************************
 * 
 * @returns {undefined}
 * Muestra mensajes de validación de camposs
 */
$(function () {
    $("#msPuestos").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600
    });
});




/*******************************************************************************
 * 
 * Funsion para cerrar el formulario de agregar puestos
 * cierra el formulario de registro de puestos
 */
    $("#salirFormPuestos").click(function(){ 
        $("#FormRegPuesto").dialog("close") ;
    });
    
    
    
/*************************************************** Planilla *********************************************************/

$('#btnBuscarP').click(function(){
    
    if($("#cboMes").val()!==""){
        $('#ManejoPlanilla').attr('action', 'RegistroPlanilla.jsp');
        
    }else{
        
         $("#DialogoPlanilla").dialog("open");
         $("#msR").val("Seleccione el Mes");        
    }
     
});


$('#btnCalcular').click(function(){
     if($("#cboMes").val()!==""){
   $('#ManejoPlanilla').attr('action', 'GuardarPlanilla');
     }else{
        
         $("#DialogoPlanilla").dialog("open");
         $("#msR").val("Seleccione el Mes");        
    }
});



      
  /*******************************************************************************
 * 
 * @returns {undefined}
 * Muestra mensajes de validación de camposs
 */
$(function () {
    $("#DialogoPlanilla").dialog({
        autoOpen: false,
        modal: true,
        resizable: true,
        width: 600,
        heiht:200
    });
    
   
    
    // Esta función solamente abre el div que contiene la tabla de puestos
    $("#btnCalcular").click(function () {
        $("#DialogoPlanilla").dialog("open");
    });
});      
 
$( "#txtAnio" ).spinner();
$( "#cboMes" ).selectmenu();




$(document).ready(function(){
    $("#NPlanilla").text($("#tcPlanilla").val());
    $("#Fecha").text($("#tFecha").val());
    $("#NEmpleado").text($("#tNombre").val());
    $("#Id").text($("#tId").val());
    $("#sBase").text("₡ "+$("#tSalario").val());
    $("#sBruto").text("₡ "+$("#tSalarioBru").val());
    $("#sNeto").text("₡ "+$("#tSalarioN").val());
    $("#Q1").text("₡ "+$("#tQ1").val());
    $("#Q2").text("₡ "+$("#tQ2").val());
    
    
    
    
    
    
});