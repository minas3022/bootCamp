document.addEventListener('DOMContentLoaded', function() {
    const tarefaEntrada = document.getElementById('nova-tarefa');
    const tarefaLista = document.getElementById('lista-tarefa');

    function addTarefa() {
        const tarefaText = tarefaEntrada.value.trim();
        if (tarefaText === '') {
            alert('Por favor, insira uma tarefa.');
            return;

        }

        const li = document.createElement('li');
        li.innerHTML = `
            <span class="tarefa-texto">${tarefaText}</span>
            <div class="tarefa-acao">
                <button class="edit" onclick="editTask(this)">Editar</button>
                <button class="complete" onclick="completeTask(this)">Concluir</button>
                <button class="delete" onclick="deleteTask(this)">Excluir</button>
            </div>
        `;
        tarefaLista.appendChild(li);
        tarefaEntrada.value = '';
    }

    window.editTask = function(button) {
        const li = button.parentElement.parentElement;
        const tarefaTextoElemento = li.querySelector('.tarefa-texto');//queryselector DOM
        const textoCorrente = tarefaTextoElemento.textContent;
        const novoTexto = prompt('Edite a tarefa:', textoCorrente);
        if (novoTexto !== null) {
            tarefaTextoElemento.textContent = novoTexto.trim();
        }
    };

    window.completeTask = function(button) {
        const li = button.parentElement.parentElement;//botão.elemento pai
        li.classList.toggle('completado');
    };

    window.deleteTask = function(button) {
        const li = button.parentElement.parentElement;
        tarefaLista.removeChild(li);
    };

    document.querySelector('.entrada-grupo button').addEventListener('click', addTarefa);
    tarefaEntrada.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            addTarefa();
        }
    });
});
