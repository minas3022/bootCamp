// programa que verifica se um ano é bissexto ou não.
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite um ano para verificar se é bissexto: ", function(ano) {
    // Converte o ano para número inteiro
    ano = parseInt(ano);

    // Verifica se o ano é bissexto
    if ((ano % 4 === 0 && ano % 100 !== 0) || (ano % 400 === 0)) {
        console.log(ano + " é um ano bissexto.");
    } else {
        console.log(ano + " não é um ano bissexto.");
    }

    rl.close();
});
