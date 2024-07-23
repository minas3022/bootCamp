// script.js

class Produto {
    constructor(nome, preco, quantidade) {
        this.nome = nome;
        this.preco = parseFloat(preco);
        this.quantidade = parseInt(quantidade);
    }
}

class CarrinhoDeCompras {
    constructor() {
        this.produtos = [];
    }

    adicionarProduto(produto) {
        this.produtos.push(produto);
        this.atualizarTotal();
    }

    calcularTotal() {
        return this.produtos.reduce((total, produto) => total + produto.preco, 0).toFixed(2);
    }

    finalizarCompra() {
        alert('Compra finalizada! Total: R$' + this.calcularTotal());
        this.produtos = [];
        this.atualizarTotal();
        this.atualizarListaProdutos();
    }

    atualizarTotal() {
        document.getElementById('total').innerText = this.calcularTotal();
    }

    atualizarListaProdutos() {
        const listaProdutos = document.getElementById('listaProdutos');
        listaProdutos.innerHTML = '';
        this.produtos.forEach(produto => {
            const li = document.createElement('li');
            li.textContent = `${produto.nome} - R$${produto.preco} - Qtd: ${produto.quantidade}`;
            listaProdutos.appendChild(li);
        });
    }
}

const carrinho = new CarrinhoDeCompras();

function adicionarProduto() {
    const nome = document.getElementById('nome').value;
    const preco = document.getElementById('preco').value;
    const quantidade = document.getElementById('quantidade').value;

    if (nome && preco && quantidade) {
        const produto = new Produto(nome, preco, quantidade);
        carrinho.adicionarProduto(produto);
        carrinho.atualizarListaProdutos();

        // Limpar campos
        document.getElementById('nome').value = '';
        document.getElementById('preco').value = '';
        document.getElementById('quantidade').value = '';
    } else {
        alert('Por favor, preencha todos os campos.');
    }
}

function finalizarCompra() {
    carrinho.finalizarCompra();
}
