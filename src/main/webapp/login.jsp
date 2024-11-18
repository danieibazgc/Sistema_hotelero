<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="css/style_login.css" />
        <title>Sistema Hotelero DG</title>
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="sign-in-form">
                        <h2 class="title">Iniciar Sesión</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="Email" placeholder="Email" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" />
                        </div>
                        <input type="submit" value="Acceder" class="btn solid" />                        
                        <p class="social-text">Visita nuestras plataformas</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
<!--
                    <form action="${pageContext.request.contextPath}/SignupServlet" method="post" class="sign-up-form">
                        <h2 class="title">Registrarse</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="username" placeholder="Username" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" name="email" placeholder="Email" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" />
                        </div>
                        <input type="submit" class="btn" value="Registrar" />
                        <p class="social-text">Visita nuestras plataformas</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                                 -->
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <!--
                    <div class="content">
                        <h3>Hotel DG</h3>
                        <p>
                            Bienvenido, administrador. En caso no tengas una cuenta, puedes crearlo.
                        </p>
                        <button class="btn transparent" id="sign-up-btn">
                            Registrarse
                        </button>
                    </div>
                    -->
                    <!-- <img src="image/log.svg" class="image" alt="" /> -->
                </div>
                
                <div class="panel right-panel">
                    <div class="content">
                        <h3>Hotel DG</h3>
                        <p>
                            Bienvenido, administrador. Si tienes una cuenta puedes iniciar sesión.
                        </p>
                        <button class="btn transparent" id="sign-in-btn">
                            Iniciar Sesión
                        </button>
                    </div>
                    <img src="image/register.svg" class="image" alt="" />
                </div>
            </div>
        </div>

        <script src="js/js_login.js"></script>
    </body>
</html>