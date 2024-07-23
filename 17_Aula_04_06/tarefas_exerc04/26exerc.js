// Arrow function que converte um array de pares chave-valor em um objeto
const arrayToObject = (array) => array.reduce((obj, [key, value]) => {
    obj[key] = value;
    return obj;
}, []);

// Exemplo de uso da função
const keyValueArray = [['nome', 'João'], ['idade', 30], ['cidade', 'São Paulo']];
const resultObject = arrayToObject(keyValueArray);

// Exibindo o resultado no console
console.log(resultObject);
