const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Digite um número inteiro positivo: ', (input) => {
  const N = parseInt(input);

  // Verifica se o número é positivo e é um inteiro
  if (isNaN(N) || N <= 0) {
    console.log('O número deve ser um inteiro positivo.');
  } else {
    // Inicializa a soma em 0
    let soma = 0;

    // Calcula a soma dos números de 1 a N usando um loop
    for (let i = 1; i <= N; i++) {
      soma += i;
    }

    // Exibe o resultado
    console.log(`A soma dos números de 1 a ${N} é: ${soma}`);
  }

  rl.close();
});
