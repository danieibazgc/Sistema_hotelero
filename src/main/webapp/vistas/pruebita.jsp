<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hotel DG</title>
        <link rel="stylesheet" href="css/style.css"/>  
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- No favicon -->
        <link rel="icon" href="data:,">

    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxs-building-house'></i>
                <span class="logo_name">HotelDG</span>
            </div>

            <ul class="nav-links">

                <li>
                    <a href="#">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="link_name">Dashboard</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Dashboard</a></li>
                    </ul>
                </li>

                <li>
                    <div class='iocn-link'>
                        <a href="#">
                            <i class='bx bx-door-open'></i>
                            <span class="link_name">Habitaciones</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>

                    <ul class="sub-menu">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/habitacionDisponible.jsp', '${pageContext.servletContext.contextPath}/js/agregarhabitacion.js')">Disponibles</a></li>
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/rareservado.jsp', '${pageContext.servletContext.contextPath}/js/rareservado.js')">Reservadas</a></li>
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/raocupado.jsp', '${pageContext.servletContext.contextPath}/js/raocupado.js')">Ocupadas</a></li>
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/habitacionMantenimiento.jsp', '${pageContext.servletContext.contextPath}/js/agregarhabitacion.js')">Mantenimiento</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/clientes.jsp', '${pageContext.servletContext.contextPath}/js/cliente.js')" >
                        <i class='bx bx-user-plus'></i>
                        <span class="link_name">Clientes</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/clientes.jsp', '${pageContext.servletContext.contextPath}/js/cliente.js')">Clientes</a></li>
                    </ul>
                </li>

                <li>
                    <div class='iocn-link'>
                        <a href="#">
                            <i class='bx bxl-product-hunt'></i>
                            <span class="link_name">Inventario</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/productos.jsp', '${pageContext.servletContext.contextPath}/js/producto.js')">Productos</a></li>
                        <li><a href="#">Venta de Productos</a></li>
                    </ul>
                </li>

                <li>
                    <div class='iocn-link'>
                        <a href="#">
                            <i class='bx bx-book' ></i>
                            <span class="link_name">Espacios</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/pisohabitacion.jsp', '${pageContext.servletContext.contextPath}/js/pisohabitacion.js')">Pisos</a></li>
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/categoriahabitacion.jsp', '${pageContext.servletContext.contextPath}/js/categoriahabitacion.js')">Categorías</a></li>
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/agregarhabitacion.jsp', '${pageContext.servletContext.contextPath}/js/agregarhabitacion.js')">Agregar Habitación</a></li>
                    </ul>
                </li>
                <!--
                <li>
                    <div class='iocn-link'>
                        <a href="#">
                            <i class='bx bxs-report' ></i>
                            <span class="link_name">Reportes</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">Diario</a></li>
                        <li><a href="#">Mensual</a></li>
                        <li><a href="#">Anual</a></li>
                    </ul>
                </li>
                -->

                <li>
                    <a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/usuarios.jsp', '${pageContext.servletContext.contextPath}/js/usuario.js')">
                        <i class='bx bxs-user-detail' ></i>
                        <span class="link_name">Administrador</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/usuarios.jsp', '${pageContext.servletContext.contextPath}/js/usuario.js')">Administrador</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/acercade.jsp', '${pageContext.servletContext.contextPath}/js/acercade.js')">
                        <i class='bx bx-book-open'></i>
                        <span class="link_name">Acerca De</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">Acerca De</a></li>
                    </ul>
                </li>

                <li>
                    <div class="profile-details">
                        <div class="profile-content">
                            <img src="image/profile.jpg" alt="profile">
                        </div>
                        <div class="name-job">
                            <%
                                Usuario usuario = (Usuario) session.getAttribute("usuario");
                                if (usuario != null) {
                            %>
                            <div class="profile_name"><%= usuario.getUsername() %></div>
                            <div class="job">Administrador</div>
                            <%
                                } else {}
                            %>
                        </div>
                        <a href="login.jsp">
                            <i class='bx bx-log-out'></i>
                        </a> 
                    </div>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="home-content">
                
                
            </div>
            <div id="contenido-derecho" class="contenido-derecho">
                <!-- Aquí se cargará el contenido dinámico -->
               <div class="main-panel">
        
            </div>
        </section>


        <script src="js/javascript.js"></script>
        <script>
                            var contextPath = '${pageContext.request.contextPath}';
        </script>

        <script>
            function cargarPagina(url, scriptUrl) {
                var xhr = new XMLHttpRequest();
                xhr.open('GET', url, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.getElementById('contenido-derecho').innerHTML = xhr.responseText;
                        cargarScript(scriptUrl);
                    }
                };
                xhr.send();
            }

            function cargarScript(scriptUrl) {
                if (scriptUrl) {
                    var script = document.createElement('script');
                    script.src = scriptUrl;
                    document.head.appendChild(script);
                }
            }

        </script>

        <!-- JAVASCRIPT del cliente.jsp JAVASCRIPT del cliente.jsp JAVASCRIPT del cliente.jsp JAVASCRIPT del cliente.jsp JAVASCRIPT del cliente.jsp JAVASCRIPT del cliente.jsp -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.all.min.js"></script>

        <%
        if (request.getAttribute("message") != null) {
        %>
        <script>
            $(document).ready(function () {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: '<%= request.getAttribute("message") %>',
                    showConfirmButton: false,
                    timer: 3000
                });
            });
        </script>
           <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="assets/js/setting-demo.js"></script>
    <script src="assets/js/demo.js"></script>
    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>
        <%
        }
        %>

    </body>
</html>
