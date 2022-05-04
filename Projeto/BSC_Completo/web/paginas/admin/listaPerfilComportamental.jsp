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
        <title>Lista Perfil Comportamental</title>

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
                        <a class="nav-link" href="listaUsuarios.jsp">Usuarios</a>
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
                        <small>
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

                    <a href="logoutAdm.jsp"> <i class="fas fa-sign-out-alt ml-1"></i> </a>

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
            <table class="table table-striped table-border table-sm table-hover table-bordered" 1px>
                <legend class="h3 mt-3">Perfil Comportamental</legend><br>
                <thead>
                    <tr>
                        <th class="table-dark" scope="col">E-mail</th>
                        <!--
                        <th class="table-dark" scope="col">q1</th>
                        <th class="table-dark" scope="col">q2</th>
                        <th class="table-dark" scope="col">q3</th>
                        <th class="table-dark" scope="col">q4</th>
                        <th class="table-dark" scope="col">q5</th>
                        <th class="table-dark" scope="col">q6</th>
                        <th class="table-dark" scope="col">q7</th>
                        <th class="table-dark" scope="col">q8</th>
                        <th class="table-dark" scope="col">q9</th>
                        <th class="table-dark" scope="col">q10</th>
                        <th class="table-dark" scope="col">q11</th>
                        <th class="table-dark" scope="col">q12</th>
                        <th class="table-dark" scope="col">q13</th>
                        <th class="table-dark" scope="col">q14</th>
                        <th class="table-dark" scope="col">q15</th>
                        <th class="table-dark" scope="col">q16</th>
                        <th class="table-dark" scope="col">q17</th>
                        <th class="table-dark" scope="col">q18</th>
                        <th class="table-dark" scope="col">q19</th>
                        <th class="table-dark" scope="col">q20</th>
                        <th class="table-dark" scope="col">q21</th>
                        <th class="table-dark" scope="col">q22</th>
                        <th class="table-dark" scope="col">q23</th>
                        <th class="table-dark" scope="col">q24</th>
                        <th class="table-dark" scope="col">q25</th>
                        -->
                        <th class="table-dark" scope="col">Total A</th>
                        <th class="table-dark" scope="col">Total C</th>
                        <th class="table-dark" scope="col">Total I</th>
                        <th class="table-dark" scope="col">Total O</th>
                        <th class="table-dark" scope="col">Resultado</th>
                        <th class="table-dark" scope="col">Ações</th>
                    </tr>
                </thead>
                <tbody>

                   <%
                        try {
                            
                            statement = new Conexao().conectar().createStatement();
                           /* result = statement.executeQuery("SELECT * FROM perfilComportamental");*/
                            result = statement.executeQuery("SELECT perfilComportamental.idPerfilComportamental,alunos.email,perfilComportamental.pcq1,perfilComportamental.pcq2,perfilComportamental.pcq3,perfilComportamental.pcq4,perfilComportamental.pcq5,perfilComportamental.pcq6,perfilComportamental.pcq7,perfilComportamental.pcq8,perfilComportamental.pcq9,perfilComportamental.pcq10,perfilComportamental.pcq11,perfilComportamental.pcq12,perfilComportamental.pcq13,perfilComportamental.pcq14,perfilComportamental.pcq15,perfilComportamental.pcq16,perfilComportamental.pcq17,perfilComportamental.pcq18,perfilComportamental.pcq19,perfilComportamental.pcq20,perfilComportamental.pcq21,perfilComportamental.pcq22,perfilComportamental.pcq23,perfilComportamental.pcq24,perfilComportamental.pcq25,perfilComportamental.a,perfilComportamental.c,perfilComportamental.i,perfilComportamental.o,perfilComportamental.resultadoComportamental FROM perfilComportamental INNER JOIN alunos ON perfilComportamental.idAluno = alunos.idAluno; ");
                            
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
                        <td><%= result.getString(23)%></td>
                        <td><%= result.getString(24)%></td>
                        <td><%= result.getString(25)%></td>
                        <td><%= result.getString(26)%></td>
                        <td><%= result.getString(27)%></td>
                        -->
                        <td><%= result.getString(28)%></td>
                        <td><%= result.getString(29)%></td>
                        <td><%= result.getString(30)%></td>
                        <td><%= result.getString(31)%></td>
                        <td><%= result.getString(32)%></td>
                        <td>
                           <!--  <a href="listaPerfilComportamental.jsp?funcao=editar&id=<%= result.getString(1)%>" class="text-info"> <i class="far fa-edit"></i> </a>-->
                           <a href="listaPerfilComportamental.jsp?funcao=excluir&id=<%= result.getString(1)%>" class="text-danger"> <i class="far fa-trash-alt"></i></i> </a> 
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
            statement.executeUpdate("DELETE FROM perfilComportamental where idPerfilComportamental = '" + id + "'");
            statement.executeUpdate("UPDATE Alunos SET perfilComportamental = 'N' WHERE idAluno = '" + idUsuario + "'");
            response.sendRedirect("listaPerfilComportamental.jsp");

        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>

<%  /*BOTAO EDITAR*/
    /*
        if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        out.print("<script>alert('Entrou na função de edição!');</script>");
    }
*/
%>