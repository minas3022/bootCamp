// // Funções - Functions
// function boasVindas(){
// console.log("Hello World");
// console.log("!!!!!");
// }

// // Sintaxe
// /**
//  * function <nome da função> (<parametros>){
//  * ...corpo da função
//  * }
//  */

// // escopo
// // function exemplo1(){
// //     let x = 5;
// //     let y = 10;
// //     console.log(`A soma é: ${x+y}`)
// // }
// // exemplo1();
// // let x = 5;
// // let y = 10;
// // function exemplo2(){
// //     console.log(`A soma é: ${x+y}`)
// // }
// // exemplo2();

// function exemplo3(a, b){
//     console.log(`A soma é: ${a+b}`)
// }
// let x = 99;
// let c = 31;
// exemplo3(x,c);

// function soma(a,b,c){
//     return a + b+ c;
// }
// // soma(12,10,8); //30
// // soma(15,20,25); // 60

// const resultado = soma(1,2,3);
// console.log(resultado); //6
// let a = 5;
// let b = 7;
// const result = soma(a,b,2);
// console.log(result); //14
// //constante com valor 14

// // const resultado2 = soma(1+1, 2+5, 3+9);
// a = 10;
// b = 20;
// console.log(result);

// function calculadora(a,b,c){
//     console.log(`A soma é ${a+b+c}`);
//     console.log(`A subtração é ${a-b-c}`);
//     console.log(`A multiplicação é ${a*b*c}`);
//     console.log(`A divisão é ${a/b/c}`);
// }
// calculadora(10,5,2);

// Retorno

function media(n1,n2,n3){
    return (n1+n2+n3)/3;;
}
// let mediaFinal = media(10,8,7);
// console.log(mediaFinal);

function estaAprovado(n1, n2, n3) {
   let med = media(n1, n2, n3);
   if (med >= 7) {
   console.log("Aprovado!");
   return true;
   } else {
   console.log("Reprovado!");
   return false;
   }
}
estaAprovado(10,7,6);