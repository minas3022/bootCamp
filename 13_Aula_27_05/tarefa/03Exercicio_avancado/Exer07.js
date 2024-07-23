//Crie um programa que verifica se três segmentos formam um triângulo
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite o comprimento do primeiro segmento: ", function(seg1) {
    rl.question("Digite o comprimento do segundo segmento: ", function(seg2) {
        rl.question("Digite o comprimento do terceiro segmento: ", function(seg3) {
            // Converte os segmentos para números
            seg1 = parseFloat(seg1);
            seg2 = parseFloat(seg2);
            seg3 = parseFloat(seg3);

            // Verifica se os segmentos formam um triângulo
            if (seg1 + seg2 > seg3 && seg1 + seg3 > seg2 && seg2 + seg3 > seg1) {
                // Determina o tipo de triângulo
                if (seg1 === seg2 && seg2 === seg3) {
                    console.log("Os segmentos formam um triângulo equilátero.");
                } else if (seg1 === seg2 || seg1 === seg3 || seg2 === seg3) {
                    console.log("Os segmentos formam um triângulo isósceles.");
                } else {
                    console.log("Os segmentos formam um triângulo escaleno.");
                }
            } else {
                console.log("Os segmentos fornecidos não formam um triângulo.");
            }

            rl.close();
        });
    });
});
