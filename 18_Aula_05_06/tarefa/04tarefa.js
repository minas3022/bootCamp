class ContaBancaria {
    constructor(numero, saldoInicial) {
        this.numero = numero;
        this.saldo = saldoInicial;
    }

    depositar(valor) {
        if (valor > 0) {
            this.saldo += valor;
            return true;
        }
        return false;
    }

    sacar(valor) {
        if (valor > 0 && valor <= this.saldo) {
            this.saldo -= valor;
            return true;
        }
        return false;
    }

    verificarSaldo() {
        return this.saldo;
    }
}

let conta;

document.getElementById('contaForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const numeroConta = document.getElementById('numeroConta').value;
    const saldoInicial = parseFloat(document.getElementById('saldoInicial').value);
    conta = new ContaBancaria(numeroConta, saldoInicial);
    alert('Conta criada com sucesso!');
    document.getElementById('contaForm').reset();
});

document.getElementById('operacaoForm').addEventListener('submit', function(event) {
    event.preventDefault();
    if (!conta) {
        alert('Por favor, crie uma conta primeiro.');
        return;
    }
    const tipoOperacao = document.getElementById('tipoOperacao').value;
    const valorOperacao = parseFloat(document.getElementById('valorOperacao').value);
    let sucesso;
    if (tipoOperacao === 'deposito') {
        sucesso = conta.depositar(valorOperacao);
        if (sucesso) {
            alert('Depósito realizado com sucesso!');
        } else {
            alert('Valor inválido para depósito.');
        }
    } else if (tipoOperacao === 'saque') {
        sucesso = conta.sacar(valorOperacao);
        if (sucesso) {
            alert('Saque realizado com sucesso!');
        } else {
            alert('Saldo insuficiente ou valor inválido para saque.');
        }
    }
    document.getElementById('operacaoForm').reset();
});

function verificarSaldo() {
    if (!conta) {
        alert('Por favor, crie uma conta primeiro.');
        return;
    }
    const saldo = conta.verificarSaldo();
    document.getElementById('saldo').textContent = `Saldo atual: R$ ${saldo.toFixed(2)}`;
}
