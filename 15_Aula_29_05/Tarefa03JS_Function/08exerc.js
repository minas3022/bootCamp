function media(numeros) {
    if (numeros.length === 0) { //caso a sequencia for 0
        return 0;               // retorna 0
    }
    
    const soma = numeros.reduce((total, numero) => total + numero, 0);
    return soma / numeros.length;
}

// Exemplo de uso
const numeros = [12,14,15,20,25];
console.log(media(numeros)); // sai 17.2

// const numerosVazio = [];
// console.log(media(numerosVazio)); // sai 0
