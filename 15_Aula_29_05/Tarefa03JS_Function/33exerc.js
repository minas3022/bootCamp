// Função que mapeia cada elemento de um array usando uma função de mapeamento
function mapearArray(array, callback) {
    let novoArray = [];
    for (let i = 0; i < array.length; i++) {
        novoArray.push(callback(array[i]));
    }
    return novoArray;
}

// Função de exemplo para mapeamento
function dobrar(x) {
    return x * 2;
}

// função mapearArray
const arrayOriginal = [1, 2, 3, 4, 5];
const arrayMapeado = mapearArray(arrayOriginal, dobrar);
console.log(arrayMapeado); // resultado [2, 4, 6, 8, 10]
