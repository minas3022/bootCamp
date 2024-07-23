function raizQuadrada(numero) {
    // Retorna a raiz quadrada do número
    return Math.sqrt(numero);
}

function calcularRaizQuadrada() {
    // Obter o valor do número inserido
    const numero = document.getElementById('numero').value;

    // Calcular a raiz quadrada do número
    const resultado = raizQuadrada(Number(numero));

    // Exibir o resultado
    document.getElementById('resultado').innerText = `A raiz quadrada de ${numero} é ${resultado}`;
}
