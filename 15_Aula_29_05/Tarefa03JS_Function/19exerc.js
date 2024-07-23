function quadrado(numero) {
    // Retorna o quadrado do número
    return numero * numero;
}

function calcularQuadrado() {
    // Obter o valor do número inserido
    const numero = document.getElementById('numero').value;

    // Calcular o quadrado do número
    const resultado = quadrado(Number(numero));

    // Exibir o resultado
    document.getElementById('resultado').innerText = `O quadrado de ${numero} é ${resultado}`;
}
