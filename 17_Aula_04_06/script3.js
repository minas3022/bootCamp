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
// console.log(frase.indexOf("c")); // 3, da esquerda p/ direita
// console.log(frase.lastIndexOf("c")); // 24, da direita p/ esquerda
// console.log(frase.indexOf("x")); // -1, nao existe
// console.log(frase.indexOf("arroz")); // 8, inicio da palavra
// let novaFrase = frase.replace("carne", "ovo"); // "Eu comi arroz, batata e ovo"
// let palavra2 = "BATATA";
// console.log(palavra2.slice(1)); //ATATA
// console.log(palavra2.slice(1, 4));

// // TEMPLATES LITERALS
// const nome = 'Joao';
// const idade = 25;
// const mensagem = `Olá, meu nome eh ${nome} e eu tenho ${idade} anos.`;


// ARRAYS

let figuras = ["coração", "ok", "joinha", "sorriso", "não"];
// console.log(figuras);
// console.log(figuras[4]);
// figuras[2] = "Legal";
// console.log(figuras);

// for(let i=0; i<figuras.length; i++){
//     console.log(figuras[i]);
// }

// for(let i=0; i<figuras.length; i++){
//     console.log(`O Valor do index ${i} é ${figuras[i]}`);
// }

// For-of
// for(let fig of figuras){
//     console.log(fig);
// }
for(let [index, fig] of figuras.entries()){
    console.log(`Índice: ${index}, valor: ${fig}`);
}

// let arr = ['a', 'b', 'c'];
// for (let [index, element] of arr.entries()) {
//     console.log(index, element);
// }

let obj = {a:1, b:2, c:3};
let arrayTeste = Object.entries(obj);
console.log(arrayTeste);

for(let [key, value] of arrayTeste){
    console.log(`Chave: ${key}, valor: ${value}`)
}

// let arrayDeStrings = ["abc","def","ghi"];
// arrayDeStrings.reverse();
// for (let i=0; i<arrayDeStrings.length; i++){
//     let stringAtual = arrayDeStrings[i];
//     for(let j=0; j<stringAtual.length; j++){
//         console.log(stringAtual[j]);
//     }
// }

// INSERIR E REMOVER ELEMENTOS
// let listaAlunos=[];
// listaAlunos.push("Douglas","Dennys");
// listaAlunos = listaAlunos.concat("Douglas","Dennys")

// listaAlunos.pop();

// console.log(listaAlunos.includes("Douglas"));
// console.log(listaAlunos.indexOf("Douglas"));

// let numeros = [1,2,3];
// function mostrarValor(valor){
//     console.log(valor);
// }
// numeros.forEach(mostrarValor);

// numeros.forEach((elemento)=>{
//     console.log(elemento);
// })

// let nomes = ["Neto", "Luciana", "Rômulo"];
// let letraCxAlta = nomes.map((nome)=>{
//     return nome.toUpperCase() + "!";
// });
// console.log(letraCxAlta)

const fs = require('fs');

let temps = [29, 5, 10, -4, 15, -20];
let tempsPositivas = temps.filter((temp)=>{
    if(temp > 0){
        return true;
    }else{
        return false;
    }
});
console.log(tempsPositivas);

let tempsPositivas2 = temps.filter((temp) => temp > 0);
tempsPositivas2.sort((a,b) => a -b);
console.log(tempsPositivas2);

tempsPositivas2.sort((a,b) => b - a);
console.log(tempsPositivas2);

let resultadoX = tempsPositivas.join(', ')

fs.writeFile('resultado.txt', resultadoX, (err)=>{
    if(err) throw err;
    console.log("O arquivo foi salvo")
});