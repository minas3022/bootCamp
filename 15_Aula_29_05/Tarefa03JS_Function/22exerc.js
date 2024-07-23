function ePalindromo(texto) {
    // Remover espaços e caracteres especiais, e converter para minúsculas
    const textoLimpo = texto.replace(/[^A-Za-z0-9]/g, '').toLowerCase();

    // Verificar se a string é igual ao seu reverso
    const reverso = textoLimpo.split('').reverse().join('');
    return textoLimpo === reverso;
}

function verificarPalindromo() {
    // Obter o valor do texto inserido
    const texto = document.getElementById('texto').value;

    // Verificar se o texto é um palíndromo
    const resultado = ePalindromo(texto);

    // Exibir o resultado
    document.getElementById('resultado').innerText = resultado ? 'O texto é um palíndromo' : 'O texto não é um palíndromo';
}
