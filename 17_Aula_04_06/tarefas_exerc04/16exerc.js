// Função arrow que filtra as strings com comprimento maior que um número fornecido
const filtrarPorComprimento = (array, comprimento) => {
    return array.filter(string => string.length > comprimento);
};

// Exemplo de uso:
const strings = ['apple', 'enciclopedia', 'orange', 'grape', 'kiwi'];
const comprimentoMinimo = 6; // é o minimo na filtragem

const stringsFiltradas = filtrarPorComprimento(strings, comprimentoMinimo);
console.log(stringsFiltradas); // Saída: ['enciclopedia'] maior que o comprimentoMinimo
