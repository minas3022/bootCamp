class JogoDaVelha {
    constructor() {
        this.board = [
            ['', '', ''],
            ['', '', ''],
            ['', '', '']
        ];
        this.currentPlayer = 'X';
        this.winner = null;
    }

    marcarPosicao(x, y) {
        if (this.board[x][y] === '' && this.winner === null) {
            this.board[x][y] = this.currentPlayer;
            if (this.verificarVencedor()) {
                this.winner = this.currentPlayer;
            } else {
                this.currentPlayer = this.currentPlayer === 'X' ? 'O' : 'X';
            }
            return true;
        }
        return false;
    }

    verificarVencedor() {
        // Verificar linhas
        for (let i = 0; i < 3; i++) {
            if (this.board[i][0] === this.currentPlayer &&
                this.board[i][1] === this.currentPlayer &&
                this.board[i][2] === this.currentPlayer) {
                return true;
            }
        }
        // Verificar colunas
        for (let i = 0; i < 3; i++) {
            if (this.board[0][i] === this.currentPlayer &&
                this.board[1][i] === this.currentPlayer &&
                this.board[2][i] === this.currentPlayer) {
                return true;
            }
        }
        // Verificar diagonais
        if (this.board[0][0] === this.currentPlayer &&
            this.board[1][1] === this.currentPlayer &&
            this.board[2][2] === this.currentPlayer) {
            return true;
        }
        if (this.board[0][2] === this.currentPlayer &&
            this.board[1][1] === this.currentPlayer &&
            this.board[2][0] === this.currentPlayer) {
            return true;
        }
        return false;
    }

    reiniciarJogo() {
        this.board = [
            ['', '', ''],
            ['', '', ''],
            ['', '', '']
        ];
        this.currentPlayer = 'X';
        this.winner = null;
    }
}

const jogo = new JogoDaVelha();

function atualizarTabuleiro() {
    const boardDiv = document.getElementById('board');
    boardDiv.innerHTML = '';
    for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
            const cell = document.createElement('div');
            cell.classList.add('cell');
            cell.innerText = jogo.board[i][j];
            cell.addEventListener('click', () => {
                if (jogo.marcarPosicao(i, j)) {
                    atualizarTabuleiro();
                    atualizarStatus();
                }
            });
            boardDiv.appendChild(cell);
        }
    }
}

function atualizarStatus() {
    const statusDiv = document.getElementById('status');
    if (jogo.winner) {
        statusDiv.innerText = `Jogador ${jogo.winner} venceu!`;
    } else {
        statusDiv.innerText = `Vez do jogador ${jogo.currentPlayer}`;
    }
}

function reiniciarJogo() {
    jogo.reiniciarJogo();
    atualizarTabuleiro();
    atualizarStatus();
}

// Inicializa o tabuleiro e o status
atualizarTabuleiro();
atualizarStatus();
