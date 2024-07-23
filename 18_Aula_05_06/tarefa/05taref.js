class Produto {
    constructor(nome, preco, quantidade) {
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
    }
}

class CarrinhoDeCompras {
    constructor() {
        this.produtos = [];
    }

    adicionarProduto(produto) {
        this.produtos.push(produto);
        this.atualizarCarrinho();
    }

    calcularTotal() {
        return this.produtos.reduce((total, produto) => total + (produto.preco * produto.quantidade), 0);
    }

    atualizarCarrinho() {
        const cartItems = document.getElementById('cart-items');
        cartItems.innerHTML = '';

        this.produtos.forEach((produto, index) => {
            const item = document.createElement('div');
            item.innerHTML = `${produto.nome} - R$ ${produto.preco.toFixed(2)} x ${produto.quantidade}`;
            cartItems.appendChild(item);
        });

        const totalAmount = document.getElementById('total-amount');
        totalAmount.innerText = this.calcularTotal().toFixed(2);
    }

    finalizarCompra() {
        if (this.produtos.length === 0) {
            alert("Carrinho está vazio!");
            return;
        }

        alert(`Compra finalizada! Total: R$ ${this.calcularTotal().toFixed(2)}`);
        this.produtos = [];
        this.atualizarCarrinho();
    }
}

const carrinhoDeCompras = new CarrinhoDeCompras();

function adicionarProduto() {
    const nome = document.getElementById('product-name').value;
    const preco = parseFloat(document.getElementById('product-price').value);
    const quantidade = parseInt(document.getElementById('product-quantity').value);

    if (!nome || isNaN(preco) || isNaN(quantidade) || preco <= 0 || quantidade <= 0) {
        alert("Por favor, preencha todos os campos corretamente.");
        return;
    }

    const produto = new Produto(nome, preco, quantidade);
    carrinhoDeCompras.adicionarProduto(produto);

    document.getElementById('product-name').value = '';
    document.getElementById('product-price').value = '';
    document.getElementById('product-quantity').value = '';
}

function finalizarCompra() {
    carrinhoDeCompras.finalizarCompra();
}
