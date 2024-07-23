function removerDuplicatas(array) {
    return [...new Set(array)];
}

function removerDuplicatasArray() {
    const arrayInput = document.getElementById('arrayInput').value;
    const array = arrayInput.split(',').map(item => item.trim());
    
    const resultado = removerDuplicatas(array);
    document.getElementById('resultado').innerText = `Array sem duplicatas: ${resultado.join(', ')}`;
}