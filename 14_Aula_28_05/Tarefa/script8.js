function contaDigito() {
    const numeroInput = document.getElementById('numero');
    const numero = numeroInput.value;

    if (numero === '' || !Number.isInteger(parseFloat(numero))) {
        alert('Por favor, insira um número inteiro válido.');
        return;
    }

    const numeroAbsoluto = Math.abs(numero); // Remove o sinal negativo, se houver
    const numDigitos = numeroAbsoluto.toString().length;

    const resultado = document.getElementById('resultado');
    resultado.textContent = `O número ${numero} tem ${numDigitos} dígitos.`;
}
