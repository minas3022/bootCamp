//Simulador de Empréstimo:    - Desenvolva um programa que simula um sistema de empréstimo, determinando se um cliente é elegível com base na renda, idade e histórico
const readline = require('readline');//Esta linha importa o módulo readline do Node.js

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function verificarElegibilidade() {
    rl.question("Digite sua renda mensal (em reais): ", function(renda) {
        rl.question("Digite sua idade: ", function(idade) {
            rl.question("Digite seu histórico de crédito (bom ou ruim): ", function(historicoCredito) {
                // Converte a renda para número
                renda = parseFloat(renda);

                // Converte a idade para número
                idade = parseInt(idade);

                // Verifica se o cliente é elegível
                if (renda >= 2000 && idade >= 18 && historicoCredito === "bom") {
                    console.log("Parabéns! Você é elegível para o empréstimo.");
                } else {
                    console.log("Desculpe, você não é elegível para o empréstimo.");
                }

                rl.close();
            });
        });
    });
}

// Inicia a verificação de elegibilidade
verificarElegibilidade();
