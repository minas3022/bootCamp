function celsiusParaFahrenheit() {
    // Obter o valor da temperatura em Celsius
    const celsius = document.getElementById('celsius').value;

    // Converter Celsius para Fahrenheit
    const fahrenheit = (celsius * 9/5) + 32;

    // Exibir o resultado
    document.getElementById('resultado').innerText = `Temperatura em Fahrenheit: ${fahrenheit.toFixed(2)}`;
}
