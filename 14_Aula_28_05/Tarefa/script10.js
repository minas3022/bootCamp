let notasPesos = [];

function adicionarNotaPeso() {
    const notaInput = document.getElementById('nota');
    const pesoInput = document.getElementById('peso');
    const nota = parseFloat(notaInput.value);
    const peso = parseFloat(pesoInput.value);

    if (isNaN(nota) || nota < 0 || nota > 10 || isNaN(peso) || peso <= 0) {
        alert('Por favor, insira uma nota válida (0-10) e um peso positivo.');
        return;
    }

    notasPesos.push({ nota, peso });
    notaInput.value = '';
    pesoInput.value = '';
    mostrarNotasPesos();
}

function mostrarNotasPesos() {
    const notasPesosDiv = document.getElementById('notasPesos');
    notasPesosDiv.innerHTML = '';
    notasPesos.forEach((np, index) => {
        const p = document.createElement('p');
        p.textContent = `Nota: ${np.nota}, Peso: ${np.peso}`;
        notasPesosDiv.appendChild(p);
    });
}

function calcularMediaPonderada() {
    if (notasPesos.length === 0) {
        alert('Nenhuma nota e peso foram adicionados.');
        return;
    }

    let somaPonderada = 0;
    let somaPesos = 0;

    notasPesos.forEach(np => {
        somaPonderada += np.nota * np.peso;
        somaPesos += np.peso;
    });

    const mediaPonderada = somaPonderada / somaPesos;

    const resultado = document.getElementById('resultado');
    resultado.textContent = `A média ponderada das notas é: ${mediaPonderada.toFixed(2)}`;
}
