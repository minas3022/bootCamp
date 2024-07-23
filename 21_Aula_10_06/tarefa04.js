document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('tabela-dados');
    const tbody = table.querySelector('tbody');
    const filterNomeInput = document.getElementById('filtro-nome');
    const filterIdadeInput = document.getElementById('filtro-idade');
    const filterCidadeInput = document.getElementById('filter-cidade');

    let data = [
        { nome: 'Alice', idade: 25, cidade: 'São Paulo' },
        { nome: 'Bob', idade: 30, cidade: 'Rio de Janeiro' },
        { nome: 'Charlie', idade: 35, cidade: 'Los Angeles' },
        { nome: 'Davi', idade: 40, cidade: 'Curitiba' },
        { nome: 'Eva', idade: 55, cidade: 'Miami' },
        { nome: 'Jose', idade: 55, cidade: 'Uberlândia' },
        { nome: 'Carlos', idade: 53, cidade: 'Araguari' },
        { nome: 'Antônio', idade: 60, cidade: 'Araguari' },
        { nome: 'Maria', idade: 43, cidade: 'Araguaia' },
        { nome: 'Lúcia', idade: 44, cidade: 'Araguari' },
        { nome: 'Carlos Eduardo', idade: 22, cidade: 'São Paulo' }
    ];

    function renderTable(data) {
        tbody.innerHTML = '';
        data.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.nome}</td>
                <td>${item.idade}</td>
                <td>${item.cidade}</td>
            `;
            tbody.appendChild(row);
        });
    }

    function sortData(column, order) {
        data.sort((a, b) => {
            if (a[column] < b[column]) {
                return order === 'asc' ? -1 : 1;
            }
            if (a[column] > b[column]) {
                return order === 'asc' ? 1 : -1;
            }
            return 0;
        });
        renderTable(data);
    }

    function filterData() {
        const nomeFiltro = filterNomeInput.value.toLowerCase();
        const idadeFiltro = filterIdadeInput.value;
        const cidadeFiltro = filterCidadeInput.value.toLowerCase();
        const filteredData = data.filter(item => {
            return (
                (!nomeFiltro || item.nome.toLowerCase().includes(nomeFiltro)) &&
                (!idadeFiltro || item.idade == idadeFiltro) &&
                (!cidadeFiltro || item.cidade.toLowerCase().includes(cidadeFiltro))
            );
        });
        renderTable(filteredData);
    }

    table.querySelectorAll('th').forEach(header => {
        header.addEventListener('click', function() {
            const column = this.getAttribute('data-column');
            const order = this.getAttribute('data-order');
            const newOrder = order === 'desc' ? 'asc' : 'desc';
            this.setAttribute('data-order', newOrder);
            sortData(column, newOrder);
        });
    });

    filterNomeInput.addEventListener('input', filterData);
    filterIdadeInput.addEventListener('input', filterData);
    filterCidadeInput.addEventListener('input', filterData);

    renderTable(data);
});
