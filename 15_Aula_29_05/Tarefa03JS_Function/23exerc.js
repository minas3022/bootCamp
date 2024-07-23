function maiorNumero(numeros) {
    // Verificar se o array está vazio
    if (numeros.length === 0) return null;

    // Inicializar a variável para o maior número
    let maior = numeros[0];

    // Percorrer o array e encontrar o maior número
    for (let i = 1; i < numeros.length; i++) {
        if (numeros[i] > maior) {
            maior = numeros[i];
        }
    }

    // Retornar o maior número
    return maior;
}

function calcularMaiorNumero() {
    // Obter o valor do input e converter para array de números
    const numerosString = document.getElementById('numeros').value;
    const numerosArray = numerosString.split(',').map(Number);

    // Calcular o maior número
    const resultado = maiorNumero(numerosArray);

    // Exibir o resultado
    document.getElementById('resultado').innerText = `O maior número é ${resultado}`;
}
