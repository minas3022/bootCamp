function contarVogais(texto) {
    // Definir as vogais
    const vogais = 'aeiouAEIOU';
    let contagem = 0;

    // Percorrer cada caractere da string
    for (let i = 0; i < texto.length; i++) {
        if (vogais.includes(texto[i])) {
            contagem++;
        }
    }

    // Retornar a contagem de vogais
    return contagem;
}

function calcularVogais() {
    // Obter o valor do texto inserido
    const texto = document.getElementById('texto').value;

    // Calcular o número de vogais no texto
    const resultado = contarVogais(texto);

    // Exibir o resultado
    document.getElementById('resultado').innerText = `O número de vogais é ${resultado}`;
}
