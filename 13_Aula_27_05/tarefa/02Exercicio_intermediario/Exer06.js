//programa que calcula o valor final após aplicar um desconto
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite o preço : ", function(precoOriginal) {
    rl.question("Digite o desconto (em percentual %): ", function(percentualDesconto) {
        // Converte o preço e o percentual de desconto para números
        precoOriginal = parseFloat(precoOriginal);
        percentualDesconto = parseFloat(percentualDesconto);

        // Verifica se o percentual de desconto é válido
        if (percentualDesconto < 0 || percentualDesconto > 100) {//se for menor do que 0 ou maior do que  100
            console.log("Percentual de desconto inválido!");
            rl.close();
            return;
        }

        // Calcula o valor do desconto
        const desconto = (precoOriginal * percentualDesconto) / 100;

        // Calcula o valor final após o desconto
        const precoFinal = precoOriginal - desconto;

        console.log("O preço final após aplicar um desconto de " + percentualDesconto + "% é: R$ " + precoFinal.toFixed(2)+" Com desconto de R$ "+desconto.toFixed(2));
        rl.close();
    });
});
