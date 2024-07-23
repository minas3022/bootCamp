//DIVISAO COM CONDIÇAO DE NAO DIVIDIR POR ZERO
function divisao(num1, num2) {
    if (num2 === 0) {
        return "Erro: divisão por zero não é permitida.";
    }
    return num1 / num2;
}


let resultado = divisao(20, 2);
console.log(resultado); 

let resultadoErro = divisao(10, 0);
console.log(resultadoErro); // NAO PERMITE DIVIDIR POR ZERO