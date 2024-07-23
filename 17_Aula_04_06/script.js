v// // STRING

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
let frase = "Aprendendo JS";
const resultado2 = ((frase)=>{
    let invertido = "";
    for (let i=frase.length-1; i>=0;i--){
        invertido += frase[i];
    }
    return invertido;
})(frase);

console.log(resultado2);


