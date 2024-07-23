// Função que ordena um array de objetos usando uma função de comparação
function ordenarPersonalizado(array, comparar) {
    return array.sort(comparar);
}

// Função de comparação de exemplo (ordena por idade em ordem crescente)
function compararPorIdade(a, b) {
    return a.idade - b.idade;
}

// Array de objetos de exemplo
const pessoas = [
    { nome: 'Carla', idade: 25 },
    { nome: 'João', idade: 30 },
    { nome: 'Maria', idade: 22 },
    { nome: 'José', idade: 28 }
];

// Testando a função ordenarPersonalizado
const pessoasOrdenadas = ordenarPersonalizado(pessoas, compararPorIdade);
console.log(pessoasOrdenadas);

// [
//     { nome: 'Maria', idade: 22 },
//     { nome: 'Carla', idade: 25 },
//     { nome: 'José', idade: 28 },
//     { nome: 'João', idade: 30 }
// ]
