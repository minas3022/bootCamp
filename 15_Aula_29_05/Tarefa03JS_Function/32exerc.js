// Função que compõe duas funções
function compor(func1, func2) {
    return function(x) {
        return func2(func1(x));
    }
}

// Funções de exemplo
function dobrar(x) {
    return x * 2;
}

function adicionarCinco(x) {
    return x + 5;
}

// Testando a composição das funções
const dobrarEAdicionarCinco = compor(dobrar, adicionarCinco);
console.log(dobrarEAdicionarCinco(3)); // Deveria retornar 11 (3 * 2 + 5)
