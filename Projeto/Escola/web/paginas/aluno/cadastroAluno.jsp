<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8"/>
        <title>Document</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link href="estiloAluno.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script type="text/javascript" src="../../javascript/main.js"></script>

    </head>

    <%
        Statement statement = null;
        ResultSet result = null;
    %>

    <body class="bg-dark bg-gradient">
        <div class=" container col-6 bg-light mt-5 p-3 rounded">

                            <form id="login-form" class="form" action="" method="post">

                                <h3 class="text-center text-dark">Cadastro de Aluno</h3>

                                <div class="form-group">
                                    <input placeholder="Nome Completo" type="text" name="txtNome" id="txtNome" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="Email" type="email" name="txtEmail" id="txtEmail" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="Digite sua senha" type="text" name="txtSenha1" id="txtSenha1" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="Digite sua senha novamente" type="text" name="txtSenha2" id="txtSenha2" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="Telefone" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  minlength="11" maxlength="13" type="text" name="txtTelefone" id="txtTelefone" class="form-control" required="required" pattern="[0-9]{11,13}">
                                </div>

                                <div class="form-group">
                                    <input type="date" name="txtDataNascimento" id="txtDataNascimento" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="CPF" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="11" minlength="11" type="text" name="txtCpf" id="txtCpf" class="form-control" required="required" pattern="[0-9]{11,11}">
                                </div>

                                <div class="form-group">
                                    <select class="form-control" id="txtEstado" name="txtEstado">
                                        <option value="1">Acre</option>
                                        <option value="2">Alagoas</option>
                                        <option value="3">Amapá</option>
                                        <option value="4">Amazonas</option>
                                        <option value="5">Bahia</option>
                                        <option value="6">Ceará</option>
                                        <option value="7">Distrito Federal</option>
                                        <option value="8">Espírito Santo</option>
                                        <option value="9">Goiás</option>
                                        <option value="10">Maranhão</option>
                                        <option value="11">Mato Grosso</option>
                                        <option value="12">Mato Grosso do Sul</option>
                                        <option value="13">Minas Gerais</option>
                                        <option value="14">Para</option>
                                        <option value="15">Paraíba</option>
                                        <option value="16">Paraná</option>
                                        <option value="17">Pernambuco</option>
                                        <option value="18">Piauí</option>
                                        <option value="19">Rio de Janeiro</option>
                                        <option value="20">Rio Grande do Norte</option>
                                        <option value="21">Rio Grande do Sul</option>
                                        <option value="22">Rondônia</option>
                                        <option value="23">Roraima</option>
                                        <option value="24">Santa Catarina</option>
                                        <option value="25">São Paulo</option>
                                        <option value="26">Sergipe</option>
                                        <option value="27">Tocantins</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input placeholder="Cidade" type="text" name="txtCidade" id="txtCidade" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input placeholder="Endereco" type="text" name="txtEndereco" id="txtEndereco" class="form-control" required="required">
                                </div>

                                <input type="submit" name="bntCadastrar" class="btn btn-outline-primary btn-md form-control" value="Cadastrar">

                            </form>

                            <form class="container" action="loginAluno.jsp">
                                <div class="mt-3">
                                    <input type="submit" name="bntLogin" class="btn btn-outline-dark btn-md form-control" value="Login Aluno">
                                </div>
                            </form>

                            <form class="container" action="../../paginas/admin/loginAdm.jsp">
                                <div class="mt-3">
                                    <input type="submit" name="bntLoginAdm" class="btn btn-outline-dark btn-md form-control" value="Login Admin">
                                </div>
                            </form>

                        </div>
                    
                <p>
                    <!-- INSERT NO BANCO -->
                    <%
                        if (request.getParameter("bntCadastrar") != null) {

                            String nome = request.getParameter("txtNome");
                            String email = request.getParameter("txtEmail");
                            String senha = request.getParameter("txtSenha2");
                            String telefone = request.getParameter("txtTelefone");
                            String dataNascimento = request.getParameter("txtDataNascimento");
                            String cpf = request.getParameter("txtCpf");
                            int estado =  Integer.parseInt(request.getParameter("txtEstado"));
                            String cidade = request.getParameter("txtCidade");
                            String endereco = request.getParameter("txtEndereco");

                            try {

                                statement = new Conexao().conectar().createStatement();

                                result = statement.executeQuery("SELECT * FROM alunos where ds_email = '" + email + "'");

                                while (result.next()) {
                                    result.getRow();
                                    if (result.getRow() > 0) {
                                        out.print("<script>alert('Aluno já cadastrado!');</script>");
                                        return;
                                    }
                                }

                                statement.executeUpdate("INSERT INTO alunos (ds_nome, ds_email, ds_senha, ds_telefone, ds_dataNascimento, ds_cpf, cd_estado, ds_cidade, ds_endereco,matematica,portugues,quimica,fisica,geografia,biologia)  VALUES ('" + nome + "','" + email + "','" + senha + "','" + telefone + "','" + dataNascimento + "','" + cpf + "'," + estado + ",'" + cidade + "','" + endereco + "','0','0','0','0','0','0')");
                                response.sendRedirect("loginAluno.jsp");

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }

                    %>
                </p>
           
    </body>
</html>