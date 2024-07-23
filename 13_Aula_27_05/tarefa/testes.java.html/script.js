function calcularIMC() {
    // Obtém os valores dos inputs
    let peso = document.getElementById('peso').value;
    let altura = document.getElementById('altura').value;

    // Verifica se os valores são válidos
    if (peso && altura) {
        // Converte os valores para números
        peso = parseFloat(peso);
        altura = parseFloat(altura);

        // Calcula o IMC
        let imc = peso / (altura ^2);

        // Exibe o resultado no parágrafo com id "resultado"
        document.getElementById('resultado').innerText = "O IMC é: " + imc.toFixed(2);
    } else {
        // Exibe uma mensagem de erro se os valores não forem válidos
        document.getElementById('resultado').innerText = "Por favor, insira valores válidos para peso e altura.";
    }
}
