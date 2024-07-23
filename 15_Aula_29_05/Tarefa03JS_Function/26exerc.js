function concatenarArrays() {
    // Obter os valores dos inputs
    let arrayInput1 = document.getElementById('arrayInput1').value;
    let arrayInput2 = document.getElementById('arrayInput2').value;
    
    // Converter os valores dos inputs em arrays de números
    let array1 = arrayInput1.split(',').map(Number);
    let array2 = arrayInput2.split(',').map(Number);
    
    // Verificar se todos os elementos dos arrays são números válidos
    if (array1.some(isNaN) || array2.some(isNaN)) {
        document.getElementById('resultado').innerText = "Por favor, insira apenas números separados por vírgula em ambos os arrays.";
        return;
    }
    
    // Concatenar os dois arrays
    let arrayConcatenado = array1.concat(array2);
    
    // Exibir o array concatenado
    document.getElementById('resultado').innerText = "Array concatenado: " + arrayConcatenado.join(', ');
}
