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

    <body class="bg-dark bg-gradient">

        <div class=" container col-4 bg-light mt-5 p-3 rounded">

            <h3 class="h3 text-center m-3">Acesso as Páginas</h3>

            <form action="paginas/aluno/cadastroAluno.jsp" class="form">
                <input type="submit" name="submit" class="btn btn-outline-primary btn-md container mt-1"  value="Cadastro de Aluno">
            </form>

            <form action="paginas/aluno/loginAluno.jsp" class="form mt-3 mb-3">
                <input type="submit" name="submit" class="btn btn-outline-dark btn-md container mt-1"  value="Acesso Aluno">
            </form>

            <form action="paginas/admin/loginAdm.jsp" class="form">
                <input type="submit" name="submit" class="btn btn-outline-dark btn-md container mt-1"  value="Acesso Administrativo">
            </form>
        </div>

    </body>
</html>

