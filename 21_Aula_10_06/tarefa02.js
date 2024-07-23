document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('form-dinamic');
    const adicCampoBtn = document.getElementById('adic-campo-btn');
    const TipoCampoSelec = document.getElementById('tipo-campo');

    adicCampoBtn.addEventListener('click', function() {
        const selectedType = TipoCampoSelec.value;
        adicCampo(selectedType);
    });

    function adicCampo(type) {
        const div = document.createElement('div');
        div.classList.add('input-grupo');

        let field;
        if (type === 'text') {
            field = document.createElement('input');
            field.type = 'text';
            field.placeholder = 'Campo de Texto';
        } else if (type === 'checkbox') {
            field = document.createElement('input');
            field.type = 'checkbox';
        } else if (type === 'button') {
            field = document.createElement('input');
            field.type = 'button';
            field.value = 'Botão';
        }

        const removeBtn = document.createElement('button');
        removeBtn.textContent = 'Remover';
        removeBtn.addEventListener('click', function() {
            form.removeChild(div);
        });

        div.appendChild(field);
        div.appendChild(removeBtn);
        form.appendChild(div);
    }
});
