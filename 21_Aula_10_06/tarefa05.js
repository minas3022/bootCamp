document.addEventListener('DOMContentLoaded', function() {
    const produtos = [
        { id: 1, name: 'Produto 1', price: 10.55 },
        { id: 2, name: 'Produto 2', price: 20.41 },
        { id: 3, name: 'Produto 3', price: 30.00 },
    ];

    const productContainer = document.querySelector('.lista-produtos');
    const cartContainer = document.querySelector('.cart-items');
    const totalPriceElement = document.getElementById('total-preco');

    let cart = [];

    function renderProducts() {
        produtos.forEach(product => {
            const productElement = document.createElement('div');
            productElement.classList.add('product');
            productElement.innerHTML = `
                <span>${product.name} - R$${product.price.toFixed(2)}</span>
                <button data-id="${product.id}">Adicionar ao Carrinho</button>
            `;
            productContainer.appendChild(productElement);
        });
    }

    function renderCart() {
        cartContainer.innerHTML = '';
        cart.forEach(item => {
            const cartItemElement = document.createElement('div');
            cartItemElement.classList.add('cart-item');
            cartItemElement.innerHTML = `
                <span>${item.name}</span>
                <input type="number" value="${item.quantity}" data-id="${item.id}">
                <span>R$${(item.price * item.quantity).toFixed(2)}</span>
                <button data-id="${item.id}">Remover</button>
            `;
            cartContainer.appendChild(cartItemElement);
        });
        updateTotalPrice();
    }

    function addToCart(productId) {
        const product = produtos.find(p => p.id === productId);
        const existingItem = cart.find(item => item.id === productId);
        if (existingItem) {
            existingItem.quantity++;
        } else {
            cart.push({ ...product, quantity: 1 });
        }
        renderCart();
    }

    function removeFromCart(productId) {
        cart = cart.filter(item => item.id !== productId);
        renderCart();
    }

    function updateQuantity(productId, quantity) {
        const item = cart.find(item => item.id === productId);
        if (item) {
            item.quantity = quantity;
            if (item.quantity <= 0) {
                removeFromCart(productId);
            } else {
                renderCart();
            }
        }
    }

    function updateTotalPrice() {
        const total = cart.reduce((acc, item) => acc + item.price * item.quantity, 0);
        totalPriceElement.textContent = total.toFixed(2);
    }

    productContainer.addEventListener('click', function(event) {
        if (event.target.tagName === 'BUTTON') {
            const productId = parseInt(event.target.dataset.id);
            addToCart(productId);
        }
    });

    cartContainer.addEventListener('click', function(event) {
        if (event.target.tagName === 'BUTTON') {
            const productId = parseInt(event.target.dataset.id);
            removeFromCart(productId);
        }
    });

    cartContainer.addEventListener('input', function(event) {
        if (event.target.tagName === 'INPUT') {
            const productId = parseInt(event.target.dataset.id);
            const quantity = parseInt(event.target.value);
            updateQuantity(productId, quantity);
        }
    });

    renderProducts();
    renderCart();
});
