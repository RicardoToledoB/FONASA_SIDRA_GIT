<%@page import="com.ws.ReplyCertificadorPrevisionalTO"%>
<%@page import="com.ws.QueryTO"%>
<%@page import="com.ws.QueryCertificadorPrevisionalTO"%>
<%@page import="com.ws.SONDACertificadoPrevisional"%>
<%@page import="com.ws.CertificadorPrevisionalSoap"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>INTEGRACION FONASA</title>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.jsp" class="logo"><b>INTEGRACION FONASA</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-tasks"></i>
                            <span class="badge bg-theme"></span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">Opciones</p>
                            </li>
                            
                           
                           
                          
                            <li class="external">
                                <a href="index.jsp">Fonasa</a>
                            </li>
                            <li class="external">
                                <a href="#">Reportes</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="index.jsp">Salir</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              	  <p class="centered"><a href="profile.html"><img src="assets/img/user.png" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">SIDRA</h5>
                  <li class="mt">
                      <a href="index.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Fonasa</span>
                      </a>
                  </li>
                  <li class="">
                      <a href="index.jsp">
                          <i class="fa fa-file"></i>
                          <span>Reportes</span>
                      </a>
                  </li>
                            
                  

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> CONSULTAR CON FONASA <i class="fa fa-dashboard"></i></h3>
          	<div class="row mt">
                    
                     <!-- Busqueda de  -->
                    <div class="showback">
      			<h4><i class="fa fa-angle-right"></i> Busqueda de Contactos</h4>
                        <form class="form-inline" role="form" method="GET" action="index.jsp">
                          <div class="form-group">
                              <label class="sr-only" for="txtRut">Buscar por Rut</label>
                              <input type="text" class="form-control" required="true"  name="txtRut" id="txtRut" placeholder="Ingresar RUT">
                          </div>
                           <div class="form-group">
                              <label class="sr-only" for="txtDv">Buscar por Rut</label>
                              <input type="text" class="form-control" required="true"  name="txtDv" id="txtDv" placeholder="Ingresar Digito Verificador">
                          </div>
                          
                          <button type="submit" class="btn btn-theme" name="btnEnviar" value="btnEnviar" id="buscar">Buscar Fonasa</button>
                      </form>
      		    </div>
                    <!-- /showback -->
                    <!-- FIN Busqueda de -->
                    <!-- CONTENIDO -->
                     <div class="col-md-12">
                      <div class="content-panel">
                          <section class="task-panel tasks-widget">
	                	<div class="panel-heading">
	                        <div class="pull-left"><h5><i class="fa fa-tasks"></i> Resultado de Busqueda Fonasa</h5></div>
	                        <br>
	                 	</div>
                          <div class="panel-body">
                             <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Fonasa</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> Campos</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> Detalle</th>
                                  
                              </tr>
                              </thead>
                              <tbody id="ver">
                              <%
                                  if(request.getParameter("btnEnviar")!=null && request.getParameter("txtRut")!=null && request.getParameter("txtDv")!=null){
                                    int txtRut=Integer.parseInt(request.getParameter("txtRut"));
                                    String txtDv=request.getParameter("txtDv");
                                    SONDACertificadoPrevisional service = new SONDACertificadoPrevisional();
                                    CertificadorPrevisionalSoap port=service.getCertificadorPrevisionalSoap();
                                    QueryCertificadorPrevisionalTO query=new QueryCertificadorPrevisionalTO();
                                    QueryTO qto = new QueryTO();
                                    qto.setTipoEmisor(0);
                                    qto.setTipoUsuario(0);
                                    query.setQueryTO(qto);
                                    query.setClaveEntidad(6160);
                                    query.setEntidad(61607900);
                                    query.setRutBeneficiario(txtRut);
                                    query.setDgvBeneficiario(txtDv);
                                    query.setCanal(0);
                                    ReplyCertificadorPrevisionalTO result = port.getCertificadoPrevisional(query);
                                    out.println("<td><a href='#'>Isapre</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getDesIsapre()+"</td>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Prais</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getDescprais()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>CODIGO Prais</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getCodigoprais()+"</td>");
                                    out.println("</tr>");
                                    out.println("<tr>");
                                    out.println("<td><a href='#'>Nombres</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getNombres()+"</td>");
                                    out.println("</tr>");
                                    out.println("<tr>");
                                    out.println("<td><a href='#'>Apellido Paterno</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getApell1()+"</td>");
                                    out.println("</tr>");
                                    out.println("<tr>");
                                    out.println("<td><a href='#'>Apellido Materno</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getApell2()+"</td>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Rut</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getRutbenef()+"</td>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Digito Verificador</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getDgvbenef()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Nacionalidad</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getDesNacionalidad()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Region</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getCdgRegion()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Comuna</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getDesComuna()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Direccion</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getDireccion()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Fecha Nacimiento</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getFechaNacimiento()+"</td>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Fecha Fallecimiento</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getFechaFallecimiento()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Direccion</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getDireccion()+"</td>");
                                    out.println("</tr>");
                                    out.println("</tr>");
                                    out.println("<td><a href='#'>Telefono</a></td>");
                                    out.println("<td class='hidden-phone'>"+result.getBeneficiarioTO().getTelefono()+"</td>");
                                    out.println("</tr>");
                                  }
                             
                              %>
                              </tbody>
                          </table>

                          </div>
                      </section>

                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
                  <!-- FIN CONTENIDO -->
                         
               
          	</div>
			
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2015 - Ricardo Toledo Barria
              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
<script>
  

  </script>
      
    
   



  </body>
</html>
