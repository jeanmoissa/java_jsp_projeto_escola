<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8"/>
        <title>Login ADM</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>

    <%
        Statement statement = null;
        ResultSet result = null;
    %>

    <body class="bg-dark">
        <div id="login " class="">
            <div class="container ">
                <div id="login-row" class=" row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6 cores">
                        <div id="login-box" class="col-md-12 bg-light p-3 mt-5 rounded">
                            <form id="login-form" class="form" action="" method="post">
                                <h3 class="text-center text-dark">Login Administrativo</h3>
                                <div class="form-group">
                                    <label for="txtusuario" class="text-dark">Usuario:</label><br>
                                    <input placeholder="" type="text" name="txtUsuario" id="txtUsuario" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <label for="txtsenha" class="text-dark">Senha:</label><br>
                                    <input placeholder="" type="password" name="txtSenha" id="txtSenha" class="form-control" required="required">
                                </div>

                                <div class="form-group">
                                    <input type="submit" name="submit" class="btn btn-outline-primary btn-md container" value="Logar">
                                </div>

                            </form>
                            <form class="container" action="../../paginas/aluno/loginAluno.jsp">
                                <div class="mt-3">
                                    <input type="submit" name="bntLoginAdm" class="btn btn-outline-dark btn-md form-control" value="Login Aluno">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <p align="center" class="mt-2 text-light">
                    <%
                        String usuario = request.getParameter("txtUsuario");
                        String senha = request.getParameter("txtSenha");
                        String nomeUsuario = "";
                        int idUsuario = 0;

                        String user = "", pass = "";
                        int i = 0;

                        try {
                            /*Conexao com MySql*/

                            statement = new Conexao().conectar().createStatement();
                            result = statement.executeQuery("SELECT * FROM usuarios where ds_email = '" + usuario + "'and ds_senha = '" + senha + "'");

                            while (result.next()) {
                                //out.print(result.getString(2));//mostra a coluna 2 do banco (nome)
                                user = result.getString(3);
                                pass = result.getString(4);
                                nomeUsuario = result.getString(2);
                                idUsuario = result.getInt(1);
                                result.last();
                                i = result.getRow();

                            }

                        } catch (Exception e) {
                            //out.print(e);
                            e.printStackTrace();
                        }

                        //out.println(i);
                        //if (usuario == "" || senha == "" || usuario == null || senha == null){
                        if (usuario == null || senha == null) {
                            out.print("Preencha os dados correntamente!");
                        } else {
                            //if(usuario.equals("jean") && senha.equals("123")){
                            //if(usuario.equals(user) && senha.equals(pass)){
                            if (i > 0) {
                                session.setAttribute("nomeUsuario", nomeUsuario);
                                session.setAttribute("idUsuario", idUsuario);
                                response.sendRedirect("areaAdm.jsp");
                                //out.print("Logado com sucesso!");
                            } else {
                                out.print("Usuario ou senha Invalidos!");
                            }
                        }
                    %>
                </p>

            </div>
        </div>
    </body>
</html>