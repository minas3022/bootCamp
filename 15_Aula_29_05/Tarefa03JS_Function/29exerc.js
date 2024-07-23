// Função currySoma usando currying
function currySoma(a) {
    return function(b) {
        return function(c) {
            return a + b + c;
        };
    };
}

// Função para interagir com o HTML
function calcularSoma() {
    const numero1 = parseInt(document.getElementById('numero1').value);
    const numero2 = parseInt(document.getElementById('numero2').value);
    const numero3 = parseInt(document.getElementById('numero3').value);
    
    if (isNaN(numero1) || isNaN(numero2) || isNaN(numero3)) {
        document.getElementById('resultado').innerText = "Por favor, insira números válidos.";
        return;
    }
    
    const resultado = currySoma(numero1)(numero2)(numero3);
    document.getElementById('resultado').innerText = `O resultado da soma é ${resultado}.`;
}
