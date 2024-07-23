let notas = [];//array p adicao de valores notas

function adicaoNota() {
    const notaInput = document.getElementById('nota');
    const nota = parseFloat(notaInput.value);

    if (!isNaN(nota) && nota >= 0 && nota <= 10) {
        notas.push(nota);
        notaInput.value = '';
        alert(`Nota ${nota} adicionada.`);
    } else {
        alert('Por favor, insira uma nota válida entre 0 e 10.');
    }
}

function calcMedia() {
    if (notas.length === 0) {
        alert('Nenhuma nota foi adicionada.');
        return;
    }

    const soma = notas.reduce((acumulador, nota) => acumulador + nota, 0);
    const media = soma / notas.length;

    const resultadoDiv = document.getElementById('resultado');
    resultadoDiv.textContent = `A MEDIA das notas : ${media.toFixed(2)}`;
}
