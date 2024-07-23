const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Gerar um número aleatório entre 1 e 100
const numeroAleatorio = Math.floor(Math.random() * 100) + 1;

console.log("Bem-vindo ao jogo de adivinhação!");
console.log("Tente adivinhar um número entre 1 e 100.");

function adivinharNumero() {
    rl.question("Digite um número: ", function(numero) {
        // Converte o número fornecido pelo jogador para inteiro
        numero = parseInt(numero);

        // Verifica se o número fornecido é igual ao número aleatório
        if (numero === numeroAleatorio) {
            console.log("Parabéns! Você adivinhou o número correto.");
            rl.close();
        } else if (numero < numeroAleatorio) {
            console.log("O número que você digitou é menor que o número correto. Tente novamente.");
            adivinharNumero(); // Chama recursivamente a função para permitir que o jogador tente novamente
        } else {
            console.log("O número que você digitou é maior que o número correto. Tente novamente.");
            adivinharNumero(); // Chama recursivamente a função para permitir que o jogador tente novamente
        }
    });
}

// Inicia o jogo
adivinharNumero();
