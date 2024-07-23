function fahrenheitParaCelsius() {
    // Obter o valor da temperatura em Fahrenheit
    const fahrenheit = document.getElementById('fahrenheit').value;

    // Converter Fahrenheit para Celsius
    const celsius = (fahrenheit - 32) * 5/9;

    // Exibir o resultado
    document.getElementById('resultado').innerText = `Temperatura em Celsius: ${celsius.toFixed(2)}`;
}
