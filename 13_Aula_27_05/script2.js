// ESTRUTURAS CONDICIONAIS
// IF ...ELSE

// Condicionais Simples


// if(idade >= 18){
//     console.log("Maior de Idade.");
// }
// Condicionais Compostas
// if(idade >= 18){
//     console.log("Maior de Idade.");
// }else{
//     console.log("Menor de Idade.");
// }
// Condicionais Encadeadas
/**
 * Menor que 12 --- Criança (if)
 * Menor que 18 --- Adolescente (else if)
 * Maior que 18 --- Adulto (else if)
 * Maior que 60 --- Idoso (else)
 */
/* let idade = 500;

if(idade >=0 && idade <=12){
    console.log("Criança");
}else if(idade >12 && idade < 18){
    console.log("Adolescente");
}else if(idade >=18 && idade < 60){
    console.log("Adulto");
}else if (idade >= 60 && idade <= 120){
    console.log("Idoso");
}else{
    console.log("Idade inválida.")
}
 */
// if(idade >= 18){
//     console.log("Maior de Idade.");
// }else{
//     console.log("Menor de Idade.");
// }
let idade=18;
console.log(idade >= 18 ? "Maior de Idade": "Menor de Idade.");

console.log(
    idade>=0 && idade<=12 ?"crianca":
    idade>12 && idade<18 ?"adolescente":
    idade>=18 && idade<60 ?"adulto":
    idade>=6 && idade<=120 ?"idoso":
    "Idade Invalida"
)