<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area ADM</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>

    <body>

        <%
            Statement statement = null;
            ResultSet result = null;
        %>

        <nav class="navbar navbar-expand-lg bg-dark">
            <a class="navbar-brand" href="areaAdm.jsp"> <img id="logo" src="../../img/book.png"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="areaAdm.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="listaUsuarios.jsp">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="listaAlunos.jsp">Alunos</a>
                    </li>
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Disciplinas
                        </a>
                        <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="#">Artes</a></li>
                            <li><a class="dropdown-item" href="#">Biologia</a></li>
                            <li><a class="dropdown-item" href="#">Ed. Física</a></li>
                            <li><a class="dropdown-item" href="#">Filosofia</a></li>
                            <li><a class="dropdown-item" href="#">Fisica</a></li>
                            <li><a class="dropdown-item" href="#">Geografia</a></li>
                            <li><a class="dropdown-item" href="#">História</a></li>
                            <li><a class="dropdown-item" href="#">Inglês</a></li>
                            <li><a class="dropdown-item" href="#">Matemática</a></li>
                            <li><a class="dropdown-item" href="#">Português</a></li>
                            <li><a class="dropdown-item" href="#">Quimica</a></li>
                            <li><a class="dropdown-item" href="#">Sociologia</a></li>

                        </ul>
                    </li>


                </ul>

                <form class="form-inline my-2 my-lg-0">
                    <span>
                        <small class="mr-1 text-light">
                            <%
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                int idUsuario = (int) session.getAttribute("idUsuario");
                                out.println(nomeUsuario);

                                if (nomeUsuario == null) {
                                    response.sendRedirect("loginAdm.jsp");
                                }
                            %>
                        </small>
                    </span>

                    <a href="logoutAdm.jsp"> <i class="fas fa-sign-out-alt ml-1"></i> </a>
                </form>
            </div>
        </nav>

        <div class="container">
            <div class="row mt-4 mb-4">
                <form class="form-inline my-2 my-lg-0 direita"><!--class="d-flex"-->
                    <input class="form-control form-control" type="search" name="txtBuscar" placeholder="Buscar alunos por nome" aria-label="Search">
                    <button class="btn btn-outline-primary btn m-1" name="btnBuscar" type="submit">Buscar</button>
                </form>
            </div>

            <table class="table table-sm table-striped text-center">
                <thead>
                    <tr>
                        <th class="table-dark" scope="col">Aluno</th>
                        <th class="table-dark" scope="col">Artes</th>
                        <th class="table-dark" scope="col">Biologia</th>
                        <th class="table-dark" scope="col">Ed. Física</th>
                        <th class="table-dark" scope="col">Filosofia</th>
                        <th class="table-dark" scope="col">Física</th>
                        <th class="table-dark" scope="col">Geografia</th>
                        <th class="table-dark" scope="col">História</th>
                        <th class="table-dark" scope="col">Inglês</th>
                        <th class="table-dark" scope="col">Matemática</th>
                        <th class="table-dark" scope="col">Português</th>
                        <th class="table-dark" scope="col">Quimica</th>
                        <th class="table-dark" scope="col">Sociologia</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        try {
                            /*Conexao com MySql*/
                            statement = new Conexao().conectar().createStatement();

                            if (request.getParameter("btnBuscar") != null) {
                                String buscar = '%' + request.getParameter("txtBuscar") + '%';
                                result = statement.executeQuery("SELECT * FROM alunos where ds_nome LIKE '" + buscar + "' order by ds_nome asc");
                            } else {
                                result = statement.executeQuery("SELECT * FROM alunos order by ds_nome asc");
                            }
                            while (result.next()) {
                    %>

                    <tr>
                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(11)%></td>
                        <td><%= result.getString(12)%></td>
                        <td><%= result.getString(13)%></td>
                        <td><%= result.getString(14)%></td>
                        <td><%= result.getString(15)%></td>
                        <td><%= result.getString(16)%></td>
                        <td><%= result.getString(17)%></td>
                        <td><%= result.getString(18)%></td>
                        <td><%= result.getString(19)%></td>
                        <td><%= result.getString(20)%></td>
                        <td><%= result.getString(21)%></td>
                        <td><%= result.getString(22)%></td>
                    </tr>

                    <%      }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
        </div>                   
    </body>
</html>