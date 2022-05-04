<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<% String pgUsuarios = "listaUsuarios.jsp"; %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuários</title>

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
                    <input class="form-control form-control" type="search" name="txtBuscar" placeholder="Buscar pelo nome" aria-label="Search">
                    <button class="btn btn-outline-primary btn m-1" type="submit" name="btnBuscar">Buscar</button>
                    <a type="button" class="btn btn-outline-primary" href="listaUsuarios.jsp?funcao=novo">Novo Usuario</a>
                </form>

            </div>

            <table class="table table-striped table-border table-hover table-bordered table-sm text-center">
                <thead>
                    <tr>
                        <th class="table-dark" scope="col">Nome</th>
                        <th class="table-dark" scope="col">Email</th>
                        <th class="table-dark" scope="col">Senha</th>
                        <th class="table-dark" scope="col">Telefone</th>
                        <th class="table-dark" scope="col">Cpf</th>
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
                                result = statement.executeQuery("SELECT * FROM usuarios where ds_nome LIKE '" + buscar + "' order by ds_nome asc");
                            } else {
                                result = statement.executeQuery("SELECT * FROM usuarios order by ds_nome asc");
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
                        <td>
                            <a href="<%=pgUsuarios%>?funcao=editar&id=<%= result.getString(1)%>" class="text-info"> <i class="far fa-edit"></i> </a>
                            <a href="<%=pgUsuarios%>?funcao=excluir&id=<%= result.getString(1)%>" class="text-danger"> <i class="far fa-trash-alt"></i></i> </a>
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
                    String xsenha = "";
                    String xnivel = "Selecione um nível";
                    if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                        titulo = "Editar Usuario";
                        btnModal = "btnEditar";
                        xid = request.getParameter("id");
                        try {
                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM usuarios where idUsuario = '" + xid + "'");
                            while (result.next()) {
                                //out.print(result.getString(2));//mostra a coluna 2 do banco (nome)
                                xnome = result.getString(2);
                                xusuario = result.getString(3);
                                xsenha = result.getString(4);
                                xnivel = result.getString(5);
                            }
                        } catch (Exception e) {
                            out.print(e);
                            //e.printStackTrace();
                        }
                    } else {
                        titulo = "Inserir Usuario";
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
                        <input value="<%=xusuario%>" type="text" name="txtUsuario" id="txtUsuario" class="form-control" required="required">
                    </div>

                    <div class="form-group">
                        <label for="txtsenha" >Senha:</label><br>
                        <input value="<%=xsenha%>" type="text" name="txtSenha" id="txtSenha" class="form-control" required="required">
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Nível</label>
                        <select class="form-control" name="txtNivel" id="txtNivel">
                            <option value="<%=xnivel%>" ><%=xnivel%></option>
                            <%
                                if (!xnivel.equals("Comum")) {
                                    out.print("<option >Comum</option>");
                                }
                                if (!xnivel.equals("Administrativo")) {
                                    out.print("<option >Administrativo</option>");
                                }
                            %>

                            <!--Adicionar o VALUE-->

                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" name="<%=btnModal%>" class="btn btn-outline-primary"><%=titulo%></button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%
    if (request.getParameter("btnSalvar") != null) {
        String usuario = request.getParameter("txtUsuario");
        String senha = request.getParameter("txtSenha");
        String nivel = request.getParameter("txtNivel");
        String nome = request.getParameter("txtNome");
        try {
            /*Conexao com MySql*/
            statement = new Conexao().conectar().createStatement();
            /**/
            result = statement.executeQuery("SELECT * FROM usuarios where email = '" + usuario + "'");
            while (result.next()) {
                result.getRow();
                if (result.getRow() > 0) {
                    out.print("<script>alert('Usuario já cadastrado!');</script>");
                    return;
                }
            }
            /**/
            statement.executeUpdate("INSERT INTO usuarios (nome, email, senha,nivel) VALUES ('" + nome + "','" + usuario + "','" + senha + "','" + nivel + "')");
            response.sendRedirect(pgUsuarios);//Usuarios.jsp
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
            statement.executeUpdate("DELETE FROM usuarios where idUsuario = '" + id + "'");
            response.sendRedirect(pgUsuarios);//usuarios.jsp
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
        String senha = request.getParameter("txtSenha");
        String nivel = request.getParameter("txtNivel");
        String id = request.getParameter("id");
        String antigo = request.getParameter("txtAntigo");
        try {
            statement = new Conexao().conectar().createStatement();
            if (!antigo.equals(usuario)) {
                result = statement.executeQuery("SELECT * FROM usuarios where email = '" + usuario + "'");
                while (result.next()) {
                    result.getRow();
                    if (result.getRow() > 0) {
                        out.print("<script>alert('Usuario já cadastrado!');</script>");
                        return;
                    }
                }
            }
            statement.executeUpdate("UPDATE usuarios SET nome = '" + nome + "',email = '" + usuario + "',senha = '" + senha + "',nivel = '" + nivel + "' WHERE idUsuario = '" + id + "'");
            response.sendRedirect(pgUsuarios);//usuarios.jsp
        } catch (Exception e) {
            //out.print(e);
            e.printStackTrace();
        }
    }
%>