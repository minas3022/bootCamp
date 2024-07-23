// Função arrow que retorna o maior número em um array
const encontrarMaiorNumero = (array) => {
    // Verifica se o array está vazio
    if (array.length === 0) {
        return undefined; // Se o array estiver vazio, retorna undefined
    }
    
    // Utiliza o método Math.max() para encontrar o maior número no array
    return Math.max(...array);
};

// Exemplo
const numeros = [5, 10, 13, 8, 12];
const maiorNumero = encontrarMaiorNumero(numeros);
console.log(maiorNumero); // Output: 13
