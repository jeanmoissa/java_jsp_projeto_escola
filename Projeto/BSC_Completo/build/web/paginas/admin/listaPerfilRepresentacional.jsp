<%-- 
    Document   : usuarios
    Created on : 15 de nov. de 2021, 11:00:52
    Author     : jeanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Perfil Representacional</title>

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
            <a class="navbar-brand" href="areaAdm.jsp"> <img id="logoStackX" src="../../img/stackx50.png"> </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="areaAdm.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listaAlunos.jsp">Alunos</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Listas de Testes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="listaPerfilComportamental.jsp">01. Perfil Comportamental</a>
                            <a class="dropdown-item" href="listaPerfilRepresentacional.jsp">02. Perfil Representacional</a>
                            <a class="dropdown-item" href="listaPerfilEmocional.jsp">03. Perfil Emocional</a>
                            <a class="dropdown-item" href="listaPerfilConhecimento.jsp">04. Perfil Conhecimentos</a>
                            <a class="dropdown-item" href="listaPerfilInteligencia.jsp">05. Perfil Inteligencia</a>
                            <a class="dropdown-item" href="listaPerfilAprendizagem.jsp">06. Perfil Aprendizagem</a>
                            <a class="dropdown-item" href="listaPerfilQPeSabotadores.jsp">07. Quoeficiente de aprendizagem</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <span>
                        <small <small class="mr-1">
                            <%
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                int idUsuario = (int) session.getAttribute("idUsuario");
                                out.println(nomeUsuario);

                                if (nomeUsuario == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                        </small>
                    </span>

                    <a href="logoutAdm.jsp"><i class="fas fa-sign-out-alt ml-1"></i> </a>

                </form>
            </div>
        </nav>
        <!-- <a href="logout.jsp">Sair</a> -->

        <div class="container-fluid">
            <div class="row mt-4 mb-4">
                <!--
                <form class="form-inline my-2 my-lg-0 ml-3">
                    <input class="form-control form-control-sm me-2" type="search" name="txtBuscar" placeholder="Buscar pelo nome" aria-label="Search">
                    <button class="btn btn-outline-info btn-sm" name="btnBuscar" type="submit">Buscar</button>
                </form>
                -->
            </div>
            <table class="table table-striped table-border table-hover table-bordered table-sm text-center" 1px>
                <legend class="h3 mt-3">Perfil Representacional</legend><br>
                <thead>
                    <tr>
                        <th  class="table-dark" scope="col">E-mail</th>
                        <!--
                        <th scope="col">R1-C</th>
                        <th scope="col">R1-A</th>
                        <th scope="col">R1-V</th>
                        <th scope="col">R1-D</th>
                        
                        <th scope="col">R2-A</th>
                        <th scope="col">R2-V</th>
                        <th scope="col">R2-D</th>
                        <th scope="col">R2-C</th>
                        
                        <th scope="col">R3-V</th>
                        <th scope="col">R3-C</th>
                        <th scope="col">R3-D</th>
                        <th scope="col">R3-A</th>
                        
                        <th scope="col">R4-A</th>
                        <th scope="col">R4-D</th>
                        <th scope="col">R4-C</th>
                        <th scope="col">R4-V</th>
                        
                        <th scope="col">R5-A</th>
                        <th scope="col">R5-D</th>
                        <th scope="col">R5-C</th>
                        <th scope="col">R5-V</th>
                        -->
                        
                        <th class="table-dark" scope="col">Total V</th>
                        <th class="table-dark" scope="col">Total C</th>
                        <th class="table-dark" scope="col">Total A</th>
                        <th class="table-dark" scope="col">Total D</th>
                        
                        
                        <th class="table-dark" scope="col">A????es</th>
                    </tr>
                </thead>
                <tbody>

                   <%
                        try {
                            
                            statement = new Conexao().conectar().createStatement();
                            //result = statement.executeQuery("SELECT * FROM perfilRepresentacional");
                            result = statement.executeQuery("SELECT perfilRepresentacional.idPerfilRepresentacional,alunos.email,perfilRepresentacional.prq1a,perfilRepresentacional.prq1b,perfilRepresentacional.prq1c,perfilRepresentacional.prq1d,perfilRepresentacional.prq2a,perfilRepresentacional.prq2b,perfilRepresentacional.prq2c,perfilRepresentacional.prq2d,perfilRepresentacional.prq3a,perfilRepresentacional.prq3b,perfilRepresentacional.prq3c,perfilRepresentacional.prq3d,perfilRepresentacional.prq4a,perfilRepresentacional.prq4b,perfilRepresentacional.prq4c,perfilRepresentacional.prq4d,perfilRepresentacional.prq5a,perfilRepresentacional.prq5b,perfilRepresentacional.prq5c,perfilRepresentacional.prq5d,perfilRepresentacional.v,perfilRepresentacional.c,perfilRepresentacional.a,perfilRepresentacional.d FROM perfilRepresentacional INNER JOIN alunos ON perfilRepresentacional.idAluno = alunos.idAluno; ");
                            
                            /*
                            SELECT perfilcomportamental.idAluno, Alunos.nome
                            FROM perfilComportamental
                            INNER JOIN alunos
                            ON perfilComportamental.idAluno = alunos.idAluno;
                             */
                            while (result.next()) {
                                //out.print(result.getString(2));//mostra a coluna 2 do banco (nome)
%>

                    <tr>
                        
                        <td><%= result.getString(2)%></td>
                        
                        <!--
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
                        <td><%= result.getString(16)%></td>
                        <td><%= result.getString(17)%></td>
                        <td><%= result.getString(18)%></td>
                        
                        <td><%= result.getString(19)%></td>
                        <td><%= result.getString(20)%></td>
                        <td><%= result.getString(21)%></td>
                        <td><%= result.getString(22)%></td>
                        -->
                        <td><%= result.getString(23)%></td>
                        <td><%= result.getString(24)%></td>
                        <td><%= result.getString(25)%></td>
                        <td><%= result.getString(26)%></td>
                       
                        
                        <td>
                           <!-- <a href="listaPerfilRepresentacional.jsp?funcao=editar&id=<%= result.getString(1)%>" class="text-info"> <i class="far fa-edit"></i> </a> -->
                            <a href="listaPerfilRepresentacional.jsp?funcao=excluir&id=<%= result.getString(1)%>" class="text-danger"> <i class="far fa-trash-alt"></i></i> </a>
                        </td>
                    </tr>

                    <%                                    }

                        } catch (Exception e) {
                            //out.print(e);
                            e.printStackTrace();
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>

<%  /*BOTAO EXCLUIR*/
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        try {
            statement = new Conexao().conectar().createStatement();
            statement.executeUpdate("DELETE FROM perfilRepresentacional WHERE idPerfilRepresentacional = '" + id + "'");
            statement.executeUpdate("UPDATE Alunos SET perfilRepresentacional = 'N' WHERE idAluno = '" + idUsuario + "'");
            response.sendRedirect("listaPerfilRepresentacional.jsp");

        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>

<%  /*BOTAO EDITAR*/
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        out.print("<script>alert('Entrou na fun????o de edi????o!');</script>");
    }
%>