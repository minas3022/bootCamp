function verificaPrimo() {
    // Obter o número inserido pelo usuário
    let numero = parseInt(document.getElementById("numero").value);
    
    // Verificar se o número é válido
    if (!isNaN(numero) && numero > 1) {
        let primo = true;

        // Verificar se o número é primo
        for (let i = 2; i <= Math.sqrt(numero); i++) {
            if (numero % i === 0) {
                primo = false;
                break;
            }
        }

        // Exibir o resultado na página HTML
        if (primo) {
            document.getElementById("resultado").innerHTML = "<p>" + numero + " é um número primo.</p>";
        } else {
            document.getElementById("resultado").innerHTML = "<p>" + numero + " não é um número primo.</p>";
        }
    } else {
        // Exibir mensagem de erro se o número não for válido
        document.getElementById("resultado").innerHTML = "<p>Por favor, insira um número inteiro positivo maior que 1.</p>";
    }
}
