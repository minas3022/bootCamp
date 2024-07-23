//FUNÇAÕ PARA CALCULAR FATORIA DE UM NUMERO
function calcularFatorial() {
    // Obter o número inserido pelo usuário
    let numero = parseInt(document.getElementById("numero").value);
    
    // Verificar se o número é válido
    if (!isNaN(numero) && numero >= 0) {
        let fatorial = 1;

        // Calcular o fatorial usando um loop
        for (let i = 1; i <= numero; i++) {
            fatorial *= i;
        }

        // Exibir o resultado na página HTML
        document.getElementById("resultado").innerHTML = "<p>O fatorial de " + numero + " é " + fatorial + ".</p>";
    } else {
        // Exibir mensagem de erro se o número não for válido
        document.getElementById("resultado").innerHTML = "<p>Por favor, insira um número inteiro não negativo.</p>";
    }
}
