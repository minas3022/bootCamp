var dataEspecifica = new Date('2024-05-31');
let dataEspecificas=dataEspecifica+1;
// Obtém o dia da semana como um número (0-6)
var diaDaSemanaNumero = dataEspecifica.getDay()+1;

// Array com os nomes dos dias da semana
var diasDaSemana = ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"];

// Obtém o nome do dia da semana correspondente
var diaDaSemanaNome = diasDaSemana[diaDaSemanaNumero];

console.log( dataEspecificas +"O dia é " + diaDaSemanaNome);