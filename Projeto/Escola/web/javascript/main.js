var nome = document.getElementById('txtNome');
var email = document.getElementById('txtEmail');
var fone = document.getElementById('txtFone');
var senha = document.getElementById('txtSenha');
var senha2 = document.getElementById('txtSenha2');

function verificarEmail(email) {
    var re = /\S+@\S+\.\S+/;
    if (!re.test(email)) {
        alert("Email Invalido!")
        return false;
    }
    return true;
}

function verificarPreenchimentoCampos() {

    var msg = '';

    if (nome === '')
        msg += '-Informe seu nome completo \n';
    if (email === '')
        msg += '-Informe seu email \n';
    if (fone === '')
        msg += '-Informe seu telefone \n';
    if (senha === '')
        msg += '-Informe sua senha \n';
    if (senha2 === '')
        msg += '-Repita sua senha \n';
    if (msg !== '') {
        alert(msg);
        return false;
    }
    return true;
}

function cadastrar(){
    if((verificarEmail===true) && (verificarPreenchimentoCampos === true))
        alert("TESTE");
}
