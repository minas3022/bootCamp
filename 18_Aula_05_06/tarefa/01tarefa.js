class Forma {
    calcularArea() {
        throw "Método calcularArea() precisa ser implementado";
    }

    calcularPerimetro() {
        throw "Método calcularPerimetro() precisa ser implementado";
    }
}

class Retangulo extends Forma {
    constructor(largura, altura) {
        super();
        this.largura = largura;
        this.altura = altura;
    }

    calcularArea() {
        return this.largura * this.altura;
    }

    calcularPerimetro() {
        return 2 * (this.largura + this.altura);
    }
}

class Circulo extends Forma {
    constructor(raio) {
        super();
        this.raio = raio;
    }

    calcularArea() {
        return Math.PI * this.raio * this.raio;
    }

    calcularPerimetro() {
        return 2 * Math.PI * this.raio;
    }
}

class Triangulo extends Forma {
    constructor(base, altura, ladoA, ladoB, ladoC) {
        super();
        this.base = base;
        this.altura = altura;
        this.ladoA = ladoA;
        this.ladoB = ladoB;
        this.ladoC = ladoC;
    }

    calcularArea() {
        return (this.base * this.altura) / 2;
    }

    calcularPerimetro() {
        return this.ladoA + this.ladoB + this.ladoC;
    }
}

function calcularRetangulo() {
    const largura = document.getElementById("rect-width").value;
    const altura = document.getElementById("rect-height").value;
    const retangulo = new Retangulo(parseFloat(largura), parseFloat(altura));
    document.getElementById("rect-result").innerText = `Área: ${retangulo.calcularArea()}, Perímetro: ${retangulo.calcularPerimetro()}`;
}

function calcularCirculo() {
    const raio = document.getElementById("circle-radius").value;
    const circulo = new Circulo(parseFloat(raio));
    document.getElementById("circle-result").innerText = `Área: ${circulo.calcularArea()}, Perímetro: ${circulo.calcularPerimetro()}`;
}

function calcularTriangulo() {
    const base = document.getElementById("triangle-base").value;
    const altura = document.getElementById("triangle-height").value;
    const ladoA = document.getElementById("triangle-sideA").value;
    const ladoB = document.getElementById("triangle-sideB").value;
    const ladoC = document.getElementById("triangle-sideC").value;
    const triangulo = new Triangulo(parseFloat(base), parseFloat(altura), parseFloat(ladoA), parseFloat(ladoB), parseFloat(ladoC));
    document.getElementById("triangle-result").innerText = `Área: ${triangulo.calcularArea()}, Perímetro: ${triangulo.calcularPerimetro()}`;
}
