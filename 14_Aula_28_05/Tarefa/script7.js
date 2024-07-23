// Gera um número aleatório entre 1 e 100
const numSecreto = Math.floor(Math.random() * 100) + 1;
let tentativas = 0;

function adivinha() {
    const palpite = parseInt(document.getElementById('palpite').value);
    const mensagem = document.getElementById('mensagem');
    tentativas++;

    if (isNaN(palpite) || palpite < 1 || palpite > 100) {
        mensagem.textContent = 'Por favor, insira um número válido entre 1 e 100.';
        return;
    }

    if (palpite === numSecreto) {
        mensagem.textContent = `Parabéns! Você acertou o número em ${tentativas} tentativas. O número era ${numSecreto}.`;
    } else if (palpite < numSecreto) {
        mensagem.textContent = 'Errou! O número é maior.';
    } else {
        mensagem.textContent = 'Errou! O número é menor.';
    }
}
