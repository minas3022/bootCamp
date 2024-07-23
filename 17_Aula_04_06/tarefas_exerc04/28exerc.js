// Arrow function que retorna um array contendo todos os valores de um objeto
const getObjectValues = (obj) => Object.values(obj);

// Exemplo de uso da função
const exampleObject = { nome: 'João', idade: 30, cidade: 'São Paulo' };
const valuesArray = getObjectValues(exampleObject);

// Exibindo o resultado no console
console.log(valuesArray); // ['João', 30, 'São Paulo']
