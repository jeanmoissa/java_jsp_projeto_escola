<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area do Aluno</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>

    <body class="bg-light">

        <%
            Statement statement = null;
            ResultSet result = null;
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="areaAluno.jsp"><img src="../../img/book.png"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active text-light" aria-current="page" href="areaAluno.jsp">Home</a>
                        </li>

                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Disciplinas
                            </a>
                            <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/artes.jsp">Artes</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/biologia.jsp">Biologia</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/edFisica.jsp">Ed. Física</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/filosofia.jsp">Filosofia</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/fisica.jsp">Fisica</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/geografia.jsp">Geografia</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/historia.jsp">História</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/ingles.jsp">Inglês</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/matematica.jsp">Matemática</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/portugues.jsp">Português</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/quimica.jsp">Quimica</a></li>
                                <li><a class="dropdown-item" href="../../paginas/disciplinas/sociologia.jsp">Sociologia</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
                <form class="form-inline my-2 my-lg-0 text-right">
                    <span>
                        <small class="mr-1 text-light">
                            <%
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                int idUsuario = (int) session.getAttribute("idUsuario");

                                out.println(nomeUsuario);

                                if (nomeUsuario == null) {
                                    response.sendRedirect("loginAluno.jsp");
                                }
                            %>
                        </small>
                    </span>
                    <a href="logout.jsp"> <i class="fas fa-sign-out-alt ml-1 "></i> </a>
                </form>
            </div>
        </nav>

        <h4 class="ml-4 m-5  ">Disciplinas</h4>
        <div class="m-5">

            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/artes.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Artes</button>
            </form>

            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/biologia.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Biologia</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/edFisica.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Ed. Física</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/filosofia.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Filosofia</button>
            </form>

            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/fisica.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Física</button>
            </form>

            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/geografia.jsp">
                <button type="submit" class="btn btn-outline-primary m-1 ">Geografia</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/historia.jsp">
                <button type="submit" class="btn btn-outline-primary m-1 ">História</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/ingles.jsp">
                <button type="submit" class="btn btn-outline-primary m-1 ">Inglês</button>
            </form>

            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/matematica.jsp">
                <button type="submit" class="btn btn-outline-primary m-1 ">Matemática</button>
            </form>

            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/portugues.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Português</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/quimica.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Química</button>
            </form>
            
            <form class="d-inline form-inline my-2 my-lg-0" action="../../paginas/disciplinas/sociologia.jsp">
                <button type="submit" class="btn btn-outline-primary m-1">Sociologia</button>
            </form>


        </div>


    </body>
</html>

