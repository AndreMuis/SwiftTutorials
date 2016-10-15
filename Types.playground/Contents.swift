import Foundation


let stringConstant : String = "constant"

var stringVariable : String = "Hello, playground"

var intVariable : Int = 5

var floatVariable : Float = 8.5

var doubleVariable : Double = 9.5

var boolVariable : Bool = true

var characterVariable : Character = "A"

var optionalIntVariable : Int?


var newIntVariable = Int(floatVariable)

// stringConstant = "Andre" // error
// intVariable = nil // error
optionalIntVariable = nil


for char : Character in stringVariable.characters
{
    print(char)
}


