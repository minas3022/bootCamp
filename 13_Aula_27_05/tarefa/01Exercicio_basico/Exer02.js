//Escreva um programa que determina se um número é par ou ímpar
const readline = require('readline');//Esta linha importa o módulo readline do Node.js

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});//interface de leitura de entrada e saida de dados do terminal

rl.question("Digite um número: ", function(numero) {
    // Converte o número para inteiro
    numero = parseInt(numero);//onvertendo a entrada do usuário para um número inteiro

    // Verifica se o número é par ou ímpar
    if (numero % 2 === 0) { //se divide por 2 resto 0
        console.log("O número " + numero + " é par.");
    } else {
        console.log("O número " + numero + " é ímpar.");
    }

    rl.close();
});
