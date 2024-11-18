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
        <!-- No favicon -->
        <link rel="icon" href="data:,">
        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="//code.tidio.co/1sujz6b9esxiqhkircsaydfhzp6khmrt.js" async></script>
        <style>
            .container {
                padding: 20px;
                max-width: 1200px;
                margin: auto;
            }
            .chart-container {
                width: 100%;
                max-width: 600px;
                margin: 20px auto;
            }
            canvas {
                width: 100% !important;
                height: 400px !important;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxs-building-house'></i>
                <span class="logo_name">HotelDG</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="#" onclick="mostrarDashboard()">
                        <i class='bx bxs-dashboard'></i>
                        <span class="link_name">Dashboard</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a href="#" onclick="mostrarDashboard()">Dashboard</a></li>
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
                    <a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/clientes.jsp', '${pageContext.servletContext.contextPath}/js/cliente.js')">
                        <i class='bx bx-user-plus'></i>
                        <span class="link_name">Clientes</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/clientes.jsp', '${pageContext.servletContext.contextPath}/js/cliente.js')">Clientes</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/productos.jsp', '${pageContext.servletContext.contextPath}/js/producto.js')">
                            <i class='bx bxl-product-hunt'></i>
                            <span class="link_name">Productos</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a href="#" onclick="cargarPagina('/hoteldg_sigh/vistas/productos.jsp', '${pageContext.servletContext.contextPath}/js/producto.js')">Productos</a></li>
                    </ul>
                </li>
                <li>
                    <div class='iocn-link'>
                        <a href="#">
                            <i class='bx bx-book'></i>
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
                            <i class='bx bxs-report'></i>
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
                        <i class='bx bxs-user-detail'></i>
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
                            <img src="image/profile.jpeg" alt="profile">
                        </div>
                        <div class="name-job">
                            <%
                                Usuario usuario = (Usuario) session.getAttribute("administrador");
                                if (usuario != null) {
                            %>
                            
                            <div class="job">Lin(Administrador)</div>
                            <%
                                }
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
                <i class='bx bx-menu'></i>
                <span class="text">Drop Down Sidebar</span>
            </div>
            <div id="contenido-derecho" class="contenido-derecho">
                <!-- Aquí se cargará el contenido dinámico -->
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

            function mostrarDashboard() {
                document.getElementById('contenido-derecho').innerHTML = `
                    <div class="container">
                        <h2>Estadísticas del Hotel</h2>
                        <div class="chart-container">
                            <canvas id="ocupacionChart"></canvas>
                        </div>
                        <div class="chart-container">
                            <canvas id="ventasChart"></canvas>
                        </div>
                        <div class="chart-container">
                            <canvas id="clientesChart"></canvas>
                        </div>
                    </div>
                `;

                // Datos de ejemplo para los gráficos
                const datosOcupacion = {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                    datasets: [{
                        label: 'Ocupación (%)',
                        data: [65, 59, 80, 81, 56, 55],
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                };

                const datosVentas = {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                    datasets: [{
                        label: 'Ventas ($)',
                        data: [1500, 2300, 1800, 3500, 2700, 3200],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                };

                const datosClientes = {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                    datasets: [{
                        label: 'Nuevos Clientes',
                        data: [200, 300, 250, 400, 350, 500],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                };

                // Crear gráficos
                const ctxOcupacion = document.getElementById('ocupacionChart').getContext('2d');
                new Chart(ctxOcupacion, {
                    type: 'line',
                    data: datosOcupacion,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                const ctxVentas = document.getElementById('ventasChart').getContext('2d');
                new Chart(ctxVentas, {
                    type: 'bar',
                    data: datosVentas,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                const ctxClientes = document.getElementById('clientesChart').getContext('2d');
                new Chart(ctxClientes, {
                    type: 'line',
                    data: datosClientes,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        </script>

        <!-- Librerías JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
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
        <%
        }
        %>
    </body>
</html>
