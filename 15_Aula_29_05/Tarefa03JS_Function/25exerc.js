function filtrarPares() {
    // Obter o valor do input
    let arrayInput = document.getElementById('arrayInput').value;
    
    // Converter o valor do input em um array de números
    let array = arrayInput.split(',').map(Number);
    
    // Verificar se todos os elementos do array são números válidos
    if (array.some(isNaN)) {
        document.getElementById('resultado').innerText = "Por favor, insira apenas números separados por vírgula.";
        return;
    }
    
    // Filtrar os números pares
    let pares = array.filter(num => num % 2 === 0);
    
    // Exibir o array de números pares
    document.getElementById('resultado').innerText = "Números pares são: " + pares.join(', ');
}
