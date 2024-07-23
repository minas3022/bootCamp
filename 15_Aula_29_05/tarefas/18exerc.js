function ePar(numero) {
    // Verificar se o número é par
    return numero % 2 === 0;
}

function verificarParidade() {
    // Obter o valor do número inserido
    const numero = document.getElementById('numero').value;

    // Verificar se o número é par
    const resultado = ePar(Number(numero));

    // Exibir o resultado
    document.getElementById('resultado').innerText = resultado ? 'O número é par' : 'O número é ímpar';
}
