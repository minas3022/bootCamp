// Função arrow que remove elementos "falsos" de um array
const removerFalsos = (array) => {
    return array.filter(elemento => !!elemento);//converte o elemento em um valor booleano usando !!elemento
};

// Exemplo de uso:
const arrayOriginal = [0, 1, false, true, '', 'hello', null, undefined, NaN];
const arraySemFalsos = removerFalsos(arrayOriginal);
console.log(arraySemFalsos); // Saída: [1, true, 'hello']
