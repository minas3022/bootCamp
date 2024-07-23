const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Pede ao usuário para inserir um número
rl.question("Insira um número: ", function(numero) {
    // Verifica se o número inserido é um número válido
    numero = parseInt(numero);//converte essa STRING EM INTEIRO
    if (!isNaN(numero)) {//isNan not a numero
        // Imprime a tabuada do número inserido
        console.log(`Tabuada de ${numero}:`);//NUMERO ALEATORIO QUE SERÁ INSERIDO
        for (let i = 1; i <= 10; i++) {//Começando com i igual a 1. Enquanto i for menor ou igual a 10, execute o bloco de código dentro do loop e, após cada execução, incremente i em 1."
            console.log(`${numero} x ${i} = ${numero * i}`);
        }
    } else {
        console.log("Por favor, insira um número válido!");
    }

    rl.close();
});
