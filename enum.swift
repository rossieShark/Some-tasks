//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum Figures {
    enum Colors: String {
        case White = "White", Black = "Black"
    }
    typealias Pos = (x: Character, y: Int)
    case Pawn(Colors, Pos)
    case Rook(Colors, Pos)
    case Knight(Colors, Pos)
    case Bishop(Colors, Pos)
    case Queen(Colors, Pos)
    case King(Colors, Pos)
}
var bKing = Figures.King(.Black, ("a", 4))
var wRook = Figures.Rook(.White, ("e", 8))
var wQueen = Figures.Queen(.White, ("e", 4))
var wKnight = Figures.Knight(.White, ("c", 6))
var wKing = Figures.King(.White, ("g", 3))
var bPawn = Figures.Pawn(.Black, ("b", 1))
let chessArray = [bKing, wRook, wQueen, wKnight, wKing, bPawn]

/*
2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию,
 которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную 
клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
*/

typealias FigureInfo = (name: String, color: Figures.Colors, position: Figures.Pos)
enum ChessFigures: String {
    case Pawn = "Pawn"
    case Rook = "Rook"
    case Knight = "Knight"
    case Bishop = "Bishop"
    case Queen = "Queen"
    case King = "King"
}
func figureInfo(figure: Figures) -> FigureInfo {
    switch figure {
    case let .Pawn(col, pos): return (ChessFigures.Pawn.rawValue, col, pos)
    case let .Rook(col, pos): return (ChessFigures.Rook.rawValue, col, pos)
    case let .Knight(col, pos): return (ChessFigures.Knight.rawValue, col, pos)
    case let .Bishop(col, pos): return (ChessFigures.Bishop.rawValue, col, pos)
    case let .Queen(col, pos): return (ChessFigures.Queen.rawValue, col, pos)
    case let .King(col, pos): return (ChessFigures.King.rawValue, col, pos)
    }
}

func draw(figures: [Figures]) {
func figureView(figures: Figures) -> Character? {
    
    typealias colors = Figures.Colors
    
    switch figures {
    case let .Pawn(col, _): return col == .White ? "♟" : "♙"
    case let .Rook(col, _): return col == .White ? "♜" : "♖"
    case let .Knight(col, _): return col == .White ? "♞" : "♘"
    case let .Bishop(col, _): return col == .White ? "♝" : "♗"
    case let .Queen(col, _): return col == .White ? "♛" : "♕" 
    case let .King(col, _): return col == .White ? "♚" : "♔"
    default: return nil
    }
}

func figure(pos: Figures.Pos) -> Character? {
    for fig in figures {
        let info = figureInfo(figure: fig)
        if pos.x == info.position.x && pos.y == info.position.y {
            return figureView(figures: fig)
        }
    }
    return nil
}
    let chessLetters = "abcdefgh"
    let chessNumbers = 1...8
    for i in chessNumbers {
        //print(9 - i)
        for (j, x) in chessLetters.enumerated() {
            if let figure = figure(pos: (x, 9 - i)) {
            print(figure, terminator: "")
                continue
        }
            print(i % 2 == j % 2 ? "⬛️" : "⬜️", terminator: "")
    }
        print()
    }
    print("a b c d e f g h")
}
draw(figures: chessArray)