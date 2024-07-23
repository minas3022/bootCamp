// Função que retorna a interseção de dois arrays
function intersecaoArrays(array1, array2) {
    return array1.filter(element => array2.includes(element));
}

// Arrays de exemplo
const array1 = [1, 2, 3, 4, 10];
const array2 = [4, 5, 6, 7, 10];

// Testando a função intersecaoArrays
const intersecao = intersecaoArrays(array1, array2);
console.log(intersecao); // resultado [4, 10]
