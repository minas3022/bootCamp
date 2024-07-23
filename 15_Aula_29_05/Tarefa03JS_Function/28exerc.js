function contemSubstring(str1, str2) {
    return str1.includes(str2);
}

function verificarSubstring() {
    const string1 = document.getElementById('string1').value;
    const string2 = document.getElementById('string2').value;
    
    const resultado = contemSubstring(string1, string2);
    document.getElementById('resultado').innerText = resultado ? "A primeira string contém a segunda string." : "A primeira string não contém a segunda string.";
}
