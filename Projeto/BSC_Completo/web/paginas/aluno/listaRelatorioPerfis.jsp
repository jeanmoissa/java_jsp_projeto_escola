<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio dos perfis</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body>

        <%
            Statement statement = null;
            ResultSet result = null;
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="areaAluno.jsp"> <img id="logoStackX" src="../../img/stackx50.png"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="areaAluno.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <span>
                        <small class="mr-1">
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
                    <a href="logout.jsp"> <i class="fas fa-sign-out-alt ml-1"></i> </a>
                </form>
            </div>
        </nav>
        <hr>
        <div class="container-fluid">
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil Comportamental</legend><br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Total A</th>
                        <th scope="col">Total C</th>
                        <th scope="col">Total I</th>
                        <th scope="col">Total O</th>
                        <th scope="col">Resultado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilComportamental WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {
                    %>

                    <tr>
                        <td><%= result.getString(2)%></td>


                        <td><%= result.getString(28)%></td>
                        <td><%= result.getString(29)%></td>
                        <td><%= result.getString(30)%></td>
                        <td><%= result.getString(31)%></td>
                        <td><%= result.getString(32)%></td>
                    </tr>

                    <%                                    }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
            <hr>
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil Representacional</legend><br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Total V</th>
                        <th scope="col">Total C</th>
                        <th scope="col">Total A</th>
                        <th scope="col">Total D</th>

                    </tr>
                </thead>
                <tbody>

                    <%
                        try {
                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilRepresentacional WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {
                    %>

                    <tr>

                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(23)%></td>
                        <td><%= result.getString(24)%></td>
                        <td><%= result.getString(25)%></td>
                        <td><%= result.getString(26)%></td>

                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
            <hr>
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil Emocional</legend><br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Saúde</th>
                        <th scope="col">Profissão</th>
                        <th scope="col">Familia</th>
                        <th scope="col">Amigos</th>
                        <th scope="col">Financeiro</th>
                        <th scope="col">Resultado</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        try {

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilEmocional WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {
                    %>

                    <tr>
                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(3)%></td>
                        <td><%= result.getString(4)%></td>
                        <td><%= result.getString(5)%></td>
                        <td><%= result.getString(6)%></td>
                        <td><%= result.getString(7)%></td>
                        <td><%= result.getString(8)%></td>

                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            //out.print(e);
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
            <hr>
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil de Inteligências Multiplas</legend><br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Linguistica</th>
                        <th scope="col">Matematica</th>
                        <th scope="col">Visual</th>
                        <th scope="col">Cinestesica</th>
                        <th scope="col">Musical</th>
                        <th scope="col">Interpessoal</th>
                        <th scope="col">Intrapessoal</th>
                        <th scope="col">Aplicada</th>
                        <th scope="col">Estrategica</th>

                    </tr>
                </thead>
                <tbody>

                    <%
                        try {

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilInteligencia WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {

                    %>

                    <tr>
                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(3)%></td>
                        <td><%= result.getString(4)%></td>
                        <td><%= result.getString(5)%></td>
                        <td><%= result.getString(6)%></td>
                        <td><%= result.getString(7)%></td>
                        <td><%= result.getString(8)%></td>
                        <td><%= result.getString(9)%></td>
                        <td><%= result.getString(10)%></td>
                        <td><%= result.getString(11)%></td>
                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
            <hr>
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil de QP e Sabotadores</legend><br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Positividade</th>
                        <th scope="col">Insistente</th>
                        <th scope="col">Prestativo</th>
                        <th scope="col">Hipervigilante</th>
                        <th scope="col">Inquieto</th>
                        <th scope="col">Controlador</th>
                        <th scope="col">Esquivo</th>
                        <th scope="col">Hiper-Realizador</th>
                        <th scope="col">Vítima</th>
                        <th scope="col">Hiper-Racional</th>
                        <th scope="col">Crítica a si</th>
                        <th scope="col">Crítica os outros</th>
                        <th scope="col">Crítica as circunstâncias</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        try {

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilQPeSabotadores WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {
                    %>

                    <tr>

                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(3)%></td>
                        <td><%= result.getString(4)%></td>
                        <td><%= result.getString(5)%></td>
                        <td><%= result.getString(6)%></td>
                        <td><%= result.getString(7)%></td>
                        <td><%= result.getString(8)%></td>
                        <td><%= result.getString(9)%></td>
                        <td><%= result.getString(10)%></td>
                        <td><%= result.getString(11)%></td>
                        <td><%= result.getString(12)%></td>
                        <td><%= result.getString(13)%></td>
                        <td><%= result.getString(14)%></td>
                        <td><%= result.getString(15)%></td>
                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
            <hr>
            <table class="table table-sm table-striped border border-dark text-center" 1px>
                <legend class="h3 mt-5">Perfil De Áreas de Conhecimento</legend><br>
                <thead>
                    <tr>
                        <th scope="col">E-mail</th>
                        <th scope="col">Area Pretendida</th>
                        <th scope="col">Essencial</th>
                        <th scope="col">Web Dev</th>
                        <th scope="col">Front-End</th>
                        <th scope="col">Back-End</th>
                        <th scope="col">DevOps</th>
                        <th scope="col">Resultado</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        try {

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM perfilConhecimento WHERE idAluno = '" + idUsuario + "' ");

                            while (result.next()) {
                    %>

                    <tr>
                        <td><%= result.getString(2)%></td>
                        <td><%= result.getString(3)%></td>
                        <td><%= result.getString(4)%></td>
                        <td><%= result.getString(5)%></td>
                        <td><%= result.getString(6)%></td>
                        <td><%= result.getString(7)%></td>
                        <td><%= result.getString(8)%></td>
                        <td><%= result.getString(9)%></td>
                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
        </div>

        <footer class="mt-5 hidden">.</footer>      

    </body>
</html>