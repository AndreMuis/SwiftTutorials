import Foundation


// Overloading

struct TicTacToeGrid
{
    var squares : [[String]]
    
    subscript(rowIndex : Int) -> [String]
    {
        get
        {
            return self.squares[rowIndex]
        }
    }
    
    subscript(rowIndex : Int, columnIndex : Int) -> String
    {
        get
        {
            return self.squares[rowIndex][columnIndex]
        }
        
        set(newValue)
        {
            self.squares[rowIndex][columnIndex] = newValue
        }
    }
}


var grid : TicTacToeGrid = TicTacToeGrid(squares: [["X", "O", "-"], ["-", "X", "-"], ["X", "-", "-"]])

grid[0]


grid.squares

grid[2, 2]

grid[2, 2] = "X"

grid.squares






