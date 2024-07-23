// OBJETOS
/**
 * CONST OBJETO = {
 *  propriedade: valor,
 *  propriedade2: valor2,
 *  metodo: function(){
 *  codigo do metodo
 * }
 * }
 */

const pessoa = {
    nome: 'Douglas',
    idade: 30
};
console.log(pessoa.nome);
pessoa.idade = 31;
console.log(pessoa['idade']);
pessoa.salario = 5000;
console.log(pessoa.salario);

pessoa['cidade'] = "São Paulo";

Object.assign(pessoa, {profissao: "Desenvolvedor", telefone: '(11)99999990'});
console.log(pessoa);
const novaPessoa={
    ...pessoa,email:'doulas@dev.com.br',
    linkedin: "link"};
    console.log(novaPessoa);

//REMOVENDO PROPRIEDADES
delete novaPessoa.linkedin;
const {email,...novaPessoa2}=novaPessoa;
console.log(novaPessoa2);

