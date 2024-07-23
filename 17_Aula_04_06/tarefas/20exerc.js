// Função arrow que recebe um array de objetos e retorna a soma de todos os valores da propriedade 'valor'
const calcularSoma = (array) => {
    // Utiliza o método reduce para somar os valores da propriedade 'valor' de todos os objetos no array
    return array.reduce((soma, objeto) => soma + objeto.valor, 0);
};

// Exemplo de uso:
const objetos = [
    { valor: 10 },
    { valor: 15 },
    { valor: 5 }
];

const soma = calcularSoma(objetos);
console.log(soma); // Output: 30
