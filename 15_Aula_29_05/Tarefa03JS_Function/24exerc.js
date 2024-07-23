function ordenarArray() {
    // Obter o valor do input
    let arrayInput = document.getElementById('arrayInput').value;
    
    // Converter o valor do input em um array de números
    let array = arrayInput.split(',').map(Number);
    
    // Verificar se todos os elementos do array são números válidos
    if (array.some(isNaN)) {
        document.getElementById('resultado').innerText = "Por favor, insira apenas números separados por vírgula.";
        return;
    }
    
    // Ordenar o array em ordem crescente
    array.sort((a, b) => a - b);
    
    // Exibir o array ordenado
    document.getElementById('resultado').innerText = "Array ordenado: " + array.join(', ');
}
