// Função arrow que realiza a composição de duas funções f e g
const composicao = (f, g) => {
    // Retorna uma nova função que recebe um argumento x e retorna f(g(x))
    return x => f(g(x));
};

// Exemplo de uso:
// Função g recebe um número e retorna o dobro dele
const g = x => x * 2;

// Função f recebe um número e retorna o número ao quadrado
const f = x => x ** 2;

// Composição de f e g
const h = composicao(f, g);

// Teste da composição
console.log(h(10)); // Resultado output sai: 400 (primeiro g(5) = 20, depois f(20) = 400) ou seja 20 ao quadrado
