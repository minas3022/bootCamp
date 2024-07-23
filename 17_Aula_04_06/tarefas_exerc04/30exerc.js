// Arrow function que agrupa elementos por uma propriedade
const groupByProperty = (array, property) => array.reduce((acc, obj) => {
    const key = obj[property];
    if (!acc[key]) {
        acc[key] = [];
    }
    acc[key].push(obj);
    return acc;
}, {});

// Exemplo de uso da função
const items = [
    { id: 1, categoria: 'frutas', nome: 'Maçãs' },
    { id: 2, categoria: 'vegetais', nome: 'Cenoura' },
    { id: 3, categoria: 'frutas', nome: 'Banana' },
    { id: 4, categoria: 'frutas', nome: 'Morango' },
    { id: 5, categoria: 'vegetais', nome: 'Brocolis' }
];

const groupedByCategory = groupByProperty(items, 'categoria');

// Exibindo o resultado no console
console.log(groupedByCategory);
/*
{
    frutas: [
        { id: 1, categoria: 'frutas', nome: 'Maçãs' },
        { id: 3, categoria: 'frutas', nome: 'Banana' },
        { id: 4, categoria: 'frutas', nome: 'Morango' }
    ],
    vegetais: [
        { id: 2, categoria: 'vegetais', nome: 'Cenoura' },
        { id: 5, categoria: 'vegetais', nome: 'Brocolis' }
    ]
}
*/
