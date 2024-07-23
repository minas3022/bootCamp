// Função contarCaracteres que recebe uma string e um caractere, e retorna o número de vezes que o caractere aparece na string
function contarCaracteres(str, char) {
    let count = 0;
    for (let i = 0; i < str.length; i++) {
        if (str[i] === char) {
            count++;
        }
    }
    return count;
}

// Manipulando o DOM para integrar a função com a interface HTML
document.getElementById('form_caract').addEventListener('submit', function(event) {//evento de submit formulário
    event.preventDefault(); // Prevenir o comportamento padrão do formulário

    const stringInput = document.getElementById('stringInput').value;
    const charInput = document.getElementById('charInput').value;

    // Verificando se o usuário inseriu exatamente um caractere
    if (charInput.length !== 1) {
        alert('Por favor, insira um único caractere.');
        return;
    }

    // Chamando a função contarCaracteres
    const resultado = contarCaracteres(stringInput, charInput);

    // Exibindo o resultado
    document.getElementById('resultado').innerText = `O caractere "${charInput}" aparece ${resultado} vezes na string.`;
});
