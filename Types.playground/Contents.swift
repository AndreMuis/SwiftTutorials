//: Playground - noun: a place where people can play

import UIKit

let stringConstant : String = "constant"

var stringVariable : String = "Hello, playground"

var intVariable : Int = 5

var floatVariable : Float = 8.5

var doubleVariable : Double = 9.5

var boolVariable : Bool = true

var characterVariable : Character = "A"

var optionalIntVariable : Int?


var newIntVariable = Int(floatVariable)

// error: stringConstant = "Andre"
optionalIntVariable = nil
// error: intVariable = nil


for char in stringVariable.characters
{
    print(char)
}


