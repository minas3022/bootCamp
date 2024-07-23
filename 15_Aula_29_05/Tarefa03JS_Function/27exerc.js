// Objeto para armazenar os resultados de fatoriais já calculados
const memo = {};

// Função de fatorial com memoização
function memoFatorial(n) {
    if (n in memo) {
        return memo[n];
    }
    if (n === 0 || n === 1) {
        return 1;
    }
    memo[n] = n * memoFatorial(n - 1);
    return memo[n];
}

// Função para interagir com o HTML
function calcularFatorial() {
    const numero = parseInt(document.getElementById('numeroInput').value);
    if (isNaN(numero) || numero < 0) {
        document.getElementById('resultado').innerText = "Por favor, insira um número inteiro não negativo.";
        return;
    }
    const resultado = memoFatorial(numero);
    document.getElementById('resultado').innerText = `Fatorial de ${numero} é ${resultado}.`;
}
