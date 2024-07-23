document.addEventListener('DOMContentLoaded', function() {
    const galleryGrid = document.querySelector('.galeria-grade');
    const modal = document.getElementById('image-modal');
    const modalImage = document.getElementById('modal-image');
    const closeModal = document.getElementById('close-modal');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');

    const images = [
        'image1.png', 'image2.png', 'image3.png', 'image4.png', 'image5.png'
    ];

    let currentIndex = 0;

    // Renderiza as miniaturas na galeria
    images.forEach((src, index) => {
        const img = document.createElement('img');
        img.src = src;
        img.alt = `Imagem ${index + 1}`;
        img.dataset.index = index;
        galleryGrid.appendChild(img);
    });

    // Abre o modal com a imagem clicada
    galleryGrid.addEventListener('click', function(event) {
        if (event.target.tagName === 'IMG') {
            currentIndex = parseInt(event.target.dataset.index);
            openModal(currentIndex);
        }
    });

    // Fecha o modal
    closeModal.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    // Navega para a imagem anterior
    prevBtn.addEventListener('click', function() {
        currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1;
        updateModalImage();
    });

    // Navega para a próxima imagem
    nextBtn.addEventListener('click', function() {
        currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0;
        updateModalImage();
    });

    function openModal(index) {
        modal.style.display = 'flex';
        updateModalImage();
    }

    function updateModalImage() {
        modalImage.src = images[currentIndex];
    }

    // Fecha o modal ao clicar fora da imagem
    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
});
