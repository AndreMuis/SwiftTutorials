//: Playground - noun: a place where people can play

import UIKit

let countAsString = "44"

let count : Int? = Int(countAsString)

if count != nil
{
    print("pass \(count!)")
}
else
{
    print("fail")
}

if let count2 = Int(countAsString)
{
    print("pass \(count2)")
}
else
{
    print("fail")
}


let first : String? = "Andre"
print("\(first!)")


let last : String! = "Muis"
print("\(last)")
