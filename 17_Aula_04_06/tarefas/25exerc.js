// Função arrow que combina duas objetos em um novo objeto
const combinarObjetos = (obj1, obj2) => {
    return {...obj1, ...obj2};
};

// Exemplo de uso:
const objeto1 = {a: 1, b: 2};
const objeto2 = {c: 3, d: 4};

const novoObjeto = combinarObjetos(objeto1, objeto2);
console.log(novoObjeto); //resultado {a: 1, b: 2, c: 3, d: 4}
