// Escreva um programa que converte notas numéricas em conceitos (A, B, C, D, F) baseado em um sistema de pontuação
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite a nota numérica (0 a 100): ", function(nota) {
    // Converte a nota para número
    nota = parseFloat(nota);

    // Verifica o conceito com base na nota
    let conceito;
    if (nota >= 90 && nota <= 100) {//atribui uma nota a uma letra
        conceito = "A";
    } else if (nota >= 80 && nota < 90) {
        conceito = "B";
    } else if (nota >= 70 && nota < 80) {
        conceito = "C";
    } else if (nota >= 60 && nota < 70) {
        conceito = "D";
    } else if (nota >= 0 && nota < 60) {
        conceito = "F";
    } else {
        console.log("Nota inválida!");
        rl.close();
        return;
    }

    console.log("O conceito correspondente à nota " + nota + " é: " + conceito);
    rl.close();
});
