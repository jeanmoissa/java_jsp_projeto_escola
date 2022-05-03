<%-- 
    Document   : matematica
    Created on : 3 de mai. de 2022, 14:53:08
    Author     : jeanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ed. Fisica</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="../aluno/areaAluno.jsp"><img src="../../img/book.png"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active text-light" aria-current="page" href="../aluno/areaAluno.jsp">Home</a>
                        </li>

                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Disciplinas
                            </a>
                            <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="artes.jsp">Artes</a></li>
                                <li><a class="dropdown-item" href="biologia.jsp">Biologia</a></li>
                                <li><a class="dropdown-item" href="edFisica.jsp">Ed. Física</a></li>
                                <li><a class="dropdown-item" href="filosofia.jsp">Filosofia</a></li>
                                <li><a class="dropdown-item" href="fisica.jsp">Fisica</a></li>
                                <li><a class="dropdown-item" href="geografia.jsp">Geografia</a></li>
                                <li><a class="dropdown-item" href="historia.jsp">História</a></li>
                                <li><a class="dropdown-item" href="ingles.jsp">Inglês</a></li>
                                <li><a class="dropdown-item" href="matematica.jsp">Matemática</a></li>
                                <li><a class="dropdown-item" href="portugues.jsp">Português</a></li>
                                <li><a class="dropdown-item" href="quimica.jsp">Quimica</a></li>
                                <li><a class="dropdown-item" href="sociologia.jsp">Sociologia</a></li>

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

        <h3 class="h3 m-3">ED. FÍSICA</h3>
    </body>
</html>
