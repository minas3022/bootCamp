class Contato {
    constructor(nome, telefone, email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }
}

class Agenda {
    constructor() {
        this.contatos = [];
    }

    adicionarContato(contato) {
        this.contatos.push(contato);
        this.atualizarListaContatos();
    }

    removerContato(nome) {
        this.contatos = this.contatos.filter(contato => contato.nome !== nome);
        this.atualizarListaContatos();
    }

    buscarContato(nome) {
        return this.contatos.filter(contato => contato.nome.toLowerCase().includes(nome.toLowerCase()));
    }

    atualizarListaContatos() {
        const listaContatos = document.getElementById('listaContatos');
        listaContatos.innerHTML = '';
        this.contatos.forEach(contato => {
            const li = document.createElement('li');
            li.textContent = `${contato.nome} - ${contato.telefone} - ${contato.email}`;
            const btnRemover = document.createElement('button');
            btnRemover.textContent = 'Remover';
            btnRemover.onclick = () => this.removerContato(contato.nome);
            li.appendChild(btnRemover);
            listaContatos.appendChild(li);
        });
    }
}

const agenda = new Agenda();

document.getElementById('contatoForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const nome = document.getElementById('nome').value;
    const telefone = document.getElementById('telefone').value;
    const email = document.getElementById('email').value;
    const contato = new Contato(nome, telefone, email);
    agenda.adicionarContato(contato);
    document.getElementById('contatoForm').reset();
});

function buscarContato() {
    const nome = document.getElementById('pesquisaNome').value;
    const resultados = agenda.buscarContato(nome);
    const listaContatos = document.getElementById('listaContatos');
    listaContatos.innerHTML = '';
    resultados.forEach(contato => {
        const li = document.createElement('li');
        li.textContent = `${contato.nome} - ${contato.telefone} - ${contato.email}`;
        const btnRemover = document.createElement('button');
        btnRemover.textContent = 'Remover';
        btnRemover.onclick = () => agenda.removerContato(contato.nome);
        li.appendChild(btnRemover);
        listaContatos.appendChild(li);
    });
}
