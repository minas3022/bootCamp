function fatorial(num) {
    if (num < 0) {
        return "Erro: número negativo não possui fatorial.";
    }
    if (num === 0 || num === 1) {
        return 1;
    }
    let resultado = 1;
    for (let i = 2; i <= num; i++) {
        resultado *= i;
    }
    return resultado;
}

// Exemplo de uso
let resultado = fatorial(5);
console.log(resultado); // Saída: 120

let resultadoZero = fatorial(0);
console.log(resultadoZero); // Saída: 1

let resultadoNegativo = fatorial(-3);
console.log(resultadoNegativo); // Saída: Erro: número negativo não possui fatorial.
