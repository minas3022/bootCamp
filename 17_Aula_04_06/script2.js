// // STRING

// /**
//  * posição
//  * 1 2 3 4 5 6 7 8 9 10 
//  * J A V A S C R I P T
//  * 0 1 2 3 4 5 6 7 8 9 - index
//  */

// // comprimento de uma string (LENGTH)
// const nome = "Douglas";
// // console.log(nome.length);
// const primeiroEndereco = 0;
// const ultimoEndereco = nome.length-1;
// // console.log(ultimoEndereco);

// // Acesso a um caractere
// console.log(nome[0]); //D
// console.log(nome[nome.length-1]);//s
// console.log(nome[100]); // undefined

// // Percorrendo uma String
// for (let i=0; i < nome.length; i++){
//     console.log(nome[i]);
// }

let texto = "Soulcode";
let resultado = "";
for (let i=texto.length-1; i>=0;i--){
    resultado += texto[i];
}
console.log(resultado);


// console.log(Array.from(texto).join(' - '));


// const inverterTexto = (texto) =>{
//     let resultado = "";
//     for (let i=texto.length-1; i>=0;i--){
//         resultado += texto[i];
//     }
//     return resultado;
// };

// console.log(inverterTexto(texto));

// IIFE (Immediately Invoked Function Expression)
// let frase = "Aprendendo JS";
// const resultado2 = ((frase)=>{
//     let invertido = "";
//     for (let i=frase.length-1; i>=0;i--){
//         invertido += frase[i];
//     }
//     return invertido;
// })(frase);

// console.log(resultado2);


// MÉTODOS
let pet = "Chloe";
console.log(pet.toLowerCase()); //chloe
console.log(pet.toUpperCase()); //CHLOE

let arquivo = 'musica.mp3';
// Verificar se a string termina com a palavra
console.log(arquivo.endsWith('.mp3'));
// Verificar se a string inicia com a palavra
console.log(arquivo.startsWith('mus'));

let frase = "Eu comi arroz, batata e carne";
// Buscar se uma frase inclui um trecho
// console.log(frase.includes("FRASE"));
// let trecho1 = 'arroz';
// let trecho2 = 'carne';
// let trecho3 = 'batata';
// let respostas = frase.includes(trecho1) && frase.includes(trecho2) && frase.includes(trecho3);
// console.log(respostas);

// const containsAll = (frase, trechos) =>{
//     return trechos.every(trecho => frase.includes(trecho));
// };
// let trechos=["arroz", "batata", "carne"];
// console.log(containsAll(frase, trechos));

// Buscar o index do caractere
console.log(frase.indexOf("c")); // 3, da esquerda p/ direita
console.log(frase.lastIndexOf("c")); // 24, da direita p/ esquerda
console.log(frase.indexOf("x")); // -1, nao existe
console.log(frase.indexOf("arroz")); // 8, inicio da palavra
let novaFrase = frase.replace("carne", "ovo"); // "Eu comi arroz, batata e ovo"
let palavra2 = "BATATA";
console.log(palavra2.slice(1)); //ATATA
console.log(palavra2.slice(1, 4));

// TEMPLATES LITERALS
const nome = 'Joao';
const idade = 25;
const mensagem = `Olá, meu nome eh ${nome} e eu tenho ${idade} anos.`;