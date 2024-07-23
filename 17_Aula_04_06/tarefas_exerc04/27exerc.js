// Arrow function que retorna um array contendo todas as chaves de um objeto
const getObjectKeys = (obj) => Object.keys(obj);

// Exemplo de uso da função
const exampleObject = { nome: 'João', idade: 30, cidade: 'São Paulo' };
const keysArray = getObjectKeys(exampleObject);

// Exibindo o resultado no console
console.log(keysArray); // ['nome', 'idade', 'cidade']
