<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<% String pgAlunos = "listaAlunos.jsp"; %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Alunos</title>

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
            <a class="navbar-brand" href="areaAdm.jsp"> <img id="logoStackX" src="../../img/book.png"> </a>
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
                        <small <small class="mr-1 text-light">
                            <%
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                int idUsuario = (int) session.getAttribute("idUsuario");
                                out.println(nomeUsuario);

                                if (nomeUsuario == null) {
                                    response.sendRedirect("logoutAdm.jsp");
                                }
                            %>
                        </small>
                    </span>

                    <a href="logoutAdm.jsp"><i class="fas fa-sign-out-alt ml-1"></i> </a>

                </form>
            </div>
        </nav>

        <div class="container">
            <div class="row mt-4 mb-4">

                <form class="form-inline my-2 my-lg-0" method="GET"><!--class="d-flex"-->
                    <input class="form-control" type="search" name="txtBuscar" placeholder="Buscar pelo nome" aria-label="Search">
                    <button class=" m-1 btn btn-outline-primary" type="submit" name="btnBuscar">Buscar</button>
                </form>

                <!--<a type="button" class="btn btn-outline-danger btn-sm ml-1" href="listaAlunos.jsp?funcao=novo">Novo Aluno</a>-->

            </div>

            <table class="table table-striped table-border table-hover table-bordered table-sm text-center">
                <thead>
                    <tr>
                        <th class="table-dark" scope="col">Nome</th>
                        <th class="table-dark" scope="col">Email</th>
                        <th class="table-dark" scope="col">Senha</th>
                        <th class="table-dark" scope="col">Telefone</th>
                        <th class="table-dark" scope="col">Data Nasc.</th>
                        <th class="table-dark" scope="col">CPF</th>
                        <th class="table-dark" scope="col">Estado</th>
                        <th class="table-dark" scope="col">Cidade</th>
                        <th class="table-dark" scope="col">Endereco</th>
                        <th class="table-dark" scope="col">Ações</th>
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
                                //out.print(result.getString(2));//mostra a coluna 2 do banco (nome)
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

                        <td>
                            <a href="<%=pgAlunos%>?funcao=editar&id=<%= result.getString(1)%>" class="text-info"> <i class="far fa-edit"></i> </a>
                            <a href="<%=pgAlunos%>?funcao=excluir&id=<%= result.getString(1)%>" class="text-danger"> <i class="far fa-trash-alt"></i></i> </a>
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

<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <%
                    String titulo = "";
                    String btnModal = "";
                    String xid = "";
                    String xnome = "";
                    String xusuario = "";
                    String xfone = "";
                    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                        titulo = "Editar Aluno";
                        btnModal = "btnEditar";
                        xid = request.getParameter("id");
                        try {
                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM alunos where idAluno = '" + xid + "'");
                            while (result.next()) {
                                //out.print(result.getString(2));//mostra a coluna 2 do banco (nome)
                                xnome = result.getString(2);
                                xusuario = result.getString(3);
                                xfone = result.getString(4);

                            }
                        } catch (Exception e) {
                            out.print(e);
                            //e.printStackTrace();
                        }
                    } else {
                        titulo = "Inserir Aluno";
                        btnModal = "btnSalvar";
                    }
                %>

                <h5 class="modal-title text-dark" id="exampleModalLabel"><%=titulo%></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form id="cadastro-form" class="form" action="" method="POST">
                <div class="modal-body">

                    <input value="<%=xusuario%>" type="hidden" name="txtAntigo" id="txtAntigo">

                    <div class="form-group">
                        <label for="txtNome" >Nome:</label><br>
                        <input value="<%=xnome%>" type="text" name="txtNome" id="txtNome" class="form-control" required="required">
                    </div>

                    <div class="form-group">
                        <label for="txtusuario" >Usuario:</label><br>
                        <input value="<%=xusuario%>" type="email" name="txtUsuario" id="txtUsuario" class="form-control" required="required">
                    </div>

                    <div class="form-group">
                        <label for="txtFone" >Telefone:</label><br>
                        <input value="<%=xfone%>" type="text" name="txtFone" id="txtFone" class="form-control" minlength="11" maxlength="11" required="required">
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="submit" name="<%=btnModal%>" class="btn btn-outline-danger"><%=titulo%></button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%
    if (request.getParameter("btnSalvar") != null) {
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsuario");
        String fone = request.getParameter("txtFone");

        try {
            /*Conexao com MySql*/
            statement = new Conexao().conectar().createStatement();
            /**/
            result = statement.executeQuery("SELECT * FROM alunos where email = '" + usuario + "'");
            while (result.next()) {
                result.getRow();
                if (result.getRow() > 0) {
                    out.print("<script>alert('Aluno já cadastrado!');</script>");
                    return;
                }
            }
            /**/
            statement.executeUpdate("INSERT INTO alunos (nome, email, fone) VALUES ('" + nome + "','" + usuario + "','" + fone + "')");
            response.sendRedirect(pgAlunos);//Usuarios.jsp
        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>

<%  /*BOTAO EXCLUIR*/
    if (request.getParameter(
            "funcao") != null && request.getParameter("funcao").equals("excluir")) {
        String id = request.getParameter("id");
        try {
            statement = new Conexao().conectar().createStatement();
            statement.executeUpdate("DELETE FROM alunos where idAluno = '" + id + "'");
            response.sendRedirect(pgAlunos);//usuarios.jsp
        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>

<%  /*BOTAO FECHAR MODAL*/
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("fechar")) {
        out.print("<script>$('#modal').modal('close');</script>");
    }
%>

<%  /*BOTAO EDITAR*/
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
        out.print("<script>$('#modal').modal('show');</script>");
    }
%>

<%  /*BOTAO NOVO*/
    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("novo")) {
        out.print("<script>$('#modal').modal('show');</script>");
    }
%>

<%  /*BOTAO EDITAR MODAL*/
    if (request.getParameter("btnEditar") != null) {
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsuario");
        String fone = request.getParameter("txtFone");

        String id = request.getParameter("id");
        String antigo = request.getParameter("txtAntigo");
        try {
            statement = new Conexao().conectar().createStatement();
            if (!antigo.equals(usuario)) {
                result = statement.executeQuery("SELECT * FROM alunos where email = '" + usuario + "'");
                while (result.next()) {
                    result.getRow();
                    if (result.getRow() > 0) {
                        out.print("<script>alert('Aluno já cadastrado!');</script>");
                        return;
                    }
                }
            }
            statement.executeUpdate("UPDATE alunos SET nome = '" + nome + "',email = '" + usuario + "',fone = '" + fone + "' WHERE idAluno = '" + id + "'");
            response.sendRedirect(pgAlunos);//usuarios.jsp
        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>