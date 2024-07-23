const readline = require('readline');//Esta linha importa o módulo readline do Node.js

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});//interface de leitura de entrada e saida de dados do terminal

rl.question('Digite um número: ', (numero) => {
  // Converte o número para um número inteiro
  numero = parseInt(numero);

  // Verifica se o número é positivo, negativo ou zero
  if (numero > 0) {
    console.log('O número é positivo.');
  } else if (numero < 0) {
    console.log('O número é negativo.');
  } else {
    console.log('O número é zero.');
  }

  rl.close();
});
