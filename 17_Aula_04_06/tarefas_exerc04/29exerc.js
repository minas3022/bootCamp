// Arrow function que retorna um novo array contendo apenas os números ímpares
const filtrarNumeros = (numbers) => numbers.filter(number => number % 2 !== 0);

// Exemplo de uso da função
const numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const oddNumbersArray = filtrarNumeros(numbersArray);

// Exibindo o resultado no console
console.log(oddNumbersArray); // [1, 3, 5, 7, 9]
