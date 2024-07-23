const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite a nota 1: ", (nota1) => {
  nota1 = parseFloat(nota1);
  console.log("A nota 1 digitada foi: " + nota1);

  rl.question("Digite a nota 2: ", (nota2) => {
    nota2 = parseFloat(nota2);
    console.log("A nota 2 digitada foi: " + nota2);

    rl.question("Digite a nota 3: ", (nota3) => {
      nota3 = parseFloat(nota3);
      console.log("A nota 3 digitada foi: " + nota3);

      var media = (nota1 + nota2 + nota3) / 3;
      console.log("A média das notas é: " + media);

      rl.close();
    });
  });
});
