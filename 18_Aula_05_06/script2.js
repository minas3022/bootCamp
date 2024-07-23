function Pessoa(nome,altura,idade){
    this.nome=nome;
    this.altura=altura;
    this.idade=idade;

}
const aluno=new Pessoa('Thiago',1.75,33);
console.log(aluno);

const aluno2=new Pessoa('Thiago',1.75,33);

const alunos={
    aluno1:aluno,
    aluno2:aluno2
}
console.log(alunos);
