function verificarIdade(){
    var idade = document.getElementById('idade').value;
    var resultado = document.getElementById('resultado');
    if(idade >=0 && idade <= 12){
        resultado.textContent = "Criança";
    } else if(idade > 12 && idade < 18 ){
        resultado.textContent = "Adolescente";
    } else if(idade >= 18 && idade < 60 ){
        resultado.textContent = "Adulto";
    } else if(idade >= 60 && idade <= 120 ){
        resultado.textContent = "Idoso";
    } else{
        resultado.textContent = "Idade Inválida";
    }
}
function verificarMes(){
var mes=document.getElementById('mes').value;
var resultado2=document.getElementById('resultado2');
switch(mes){
    case "1":
        resultado2.textContent = "Janeiro: Primeiro mês do ano";
        break;
    case "2":
        resultado2.textContent = "Fevereiro: Segundo mês do ano";
        break;
    case "3":
        resultado2.textContent = "Março: Terceiro mês do ano";
        break;
    case "4":
        resultado2.textContent = "Abril: Quarto mês do ano";
        break;
    case "5":
        resultado2.textContent = "Maio: Quinto mês do ano";
        break;
    case "6":
        resultado2.textContent = "Junho: Sexto mês do ano";
        break;
    case "7":
        resultado2.textContent = "Julho: Setimo mês do ano";
        break;
    case "8":
        resultado2.textContent = "Agostoso: Oitavo mês do ano";
        break;
    case "9":
        resultado2.textContent = "Setembro: Nono mês do ano";
        break;
    case "10":
        resultado2.textContent = "Outubro: Decimo mês do ano";
        break;
    case "11":
        resultado2.textContent = "Novembro: Decimo primeiro mês do ano";
        break;
    case "12":
        resultado2.textContent = "Dezembro: Decimo segundo mês do ano";
        break;
    default:
        resultado2.textContent = "Por favor, selecione um mês.";
        break;
 

}


}
