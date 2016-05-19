//: Playground - noun: a place where people can play

import UIKit

var number : Int = 7

switch number
{
case 0:
    print("zero")
    
case 2, 4, 6, 8:
    print("even")

case 1, 3, 5, 7:
    print("odd")
    
default:
    print("something else")
}


number = 3

switch number
{
    case 1...5:
    print("between 1 and 5")
        
    case 6...10:
    print("between 6 and 10")
        
    default:
    print("something else")
}



let tuple = (first: 4, second: 5, third: 6)

switch tuple
{
case (2, 2, 2):
    print("contains all 2's")
    
case (3, _, _), (_, 3, _), (_, _, 3):
    print("at least one number is 3")
    
case (1...10, 1...10, 1...10):
    print("all numbers are between 1 and 10")

case (let x, let y, let z): // Value Binding
    print("first is \(x), second is \(y), third is \(z)")
}



// Where Clauses

let tuple2 = (2, 4)

switch tuple2
{
case let (x, y) where y == 2 * x:
    print("y == 2 * x")
    
case let (x, y):
    print("first is \(x), second is \(y)")
}




















