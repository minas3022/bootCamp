function reduzirArray(array, callback) {
    return array.reduce(callback);
}

// Callback para soma
function soma(total, num) {
    return total + num;
}

// Callback para produto
function produto(total, num) {
    return total * num;
}

// Função para interagir com o HTML e calcular a redução (soma)
function calcularReducao() {
    const arrayInput = document.getElementById('arrayInput').value;
    const array = arrayInput.split(',').map(Number);
    
    if (array.some(isNaN)) {
        document.getElementById('resultado').innerText = "Por favor, insira apenas números separados por vírgula.";
        return;
    }
    
    const resultado = reduzirArray(array, soma);
    document.getElementById('resultado').innerText = `Resultado da soma: ${resultado}`;
}

// Função para interagir com o HTML e calcular a redução (produto)
function calcularReducaoProduto() {
    const arrayInput = document.getElementById('arrayInput').value;
    const array = arrayInput.split(',').map(Number);
    
    if (array.some(isNaN)) {
        document.getElementById('resultado').innerText = "Por favor, insira apenas números separados por vírgula.";
        return;
    }
    
    const resultado = reduzirArray(array, produto);
    document.getElementById('resultado').innerText = `Resultado do produto: ${resultado}`;
}