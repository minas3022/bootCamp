
const readline = require('readline');//função do Node.js que importa o módulo readline

const rl = readline.createInterface({//cria uma instância de Interface do readline
    input: process.stdin, //FLUXO DE ENTRADA
    output: process.stdout // FLUXO DE SAIDA
});

function ePrimo(num) {
    if (num <= 1) {
        return false;
    }
    for (let i = 2; i <= Math.sqrt(num); i++) {//Math.sqrt() retorna a raiz quadrada de um número
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

rl.question('Digite um número: ', (input) => {
    const numero = parseInt(input, 10);
    if (isNaN(numero)) {
        console.log('Por favor, digite um número válido.');
    } else {
        const resultado = ePrimo(numero);
        if (resultado) {
            console.log(`${numero} é um número primo.`);
        } else {
            console.log(`${numero} não é um número primo.`);
        }
    }
    rl.close();
});
