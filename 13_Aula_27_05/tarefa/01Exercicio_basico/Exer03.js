//Calculadora Simples:   - Implemente uma calculadora que recebe dois números e uma operação 
//abertura usando o módulo readline do Node.js:
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite o primeiro número: ", function(primeiroNumero) {
    rl.question("Digite o segundo número: ", function(segundoNumero) {
        rl.question("Digite a operação (adição [+], subtração [-], multiplicação [*], divisão [/]): ", function(operacao) {
            // Converte os números para float
            primeiroNumero = parseFloat(primeiroNumero);//convertendo a entrada do usuário para um número float
            segundoNumero = parseFloat(segundoNumero);//convertendo a entrada do usuário para um número float

            // Verifica a operação e calcula o resultado
            let resultado;
            switch (operacao) {
                case '+':
                    resultado = primeiroNumero + segundoNumero;
                    break;
                case '-':
                    resultado = primeiroNumero - segundoNumero;
                    break;
                case '*':
                    resultado = primeiroNumero * segundoNumero;
                    break;
                case '/':
                    if (segundoNumero !== 0) {
                        resultado = primeiroNumero / segundoNumero;
                    } else {
                        console.log("Erro: divisão por zero!");
                        rl.close();
                        return;
                    }
                    break;
                default:
                    console.log("Operação inválida!");
                    rl.close();
                    return;
            }

            console.log("O resultado da operação é: " + resultado);
            rl.close();
        });
    });
});
