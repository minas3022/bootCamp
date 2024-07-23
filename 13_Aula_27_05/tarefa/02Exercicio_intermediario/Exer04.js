//Crie um programa que determina a categoria de uma pessoa baseada na idade
const readline = require('readline');//Esta linha importa o módulo readline do Node.js

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout //criando uma interface de leitura
});

rl.question("Digite a idade da pessoa: ", function(idade) {
    // Converte a idade para número inteiro
    idade = parseInt(idade);//converte string de usuario para inteiro

    // Verifica a categoria com base na idade
    let categoria;
    if (idade >= 0 && idade <= 12) {// entre 0 e 12
        categoria = "criança";
    } else if (idade >= 13 && idade <= 17) {
        categoria = "adolescente";
    } else if (idade >= 18 && idade <= 59) {
        categoria = "adulta";
    } else if (idade >= 60 && idade <= 120) {
        categoria = "idosa";    
    } 
        else if (idade < 0 ) {
        console.log("Não existe idade negativa!");;    
    }
        else {
        console.log("Essa idade inválida!");
        rl.close();
        return;
    }

    console.log("Essa pessoa é: " + categoria );
    rl.close();
});
