//: Playground - noun: a place where people can play

import UIKit


arc4random()

var numbers : Array<UInt32> = []

for count : Int in 1 ... 5
{
    numbers.append(arc4random() % 3 + 1)
}

numbers


for element : UInt32 in numbers
{
    print(element)
}


let person : Dictionary =
[
    "firstName" : "Andre",
    "lastName" : "Muis"
]

for (key, value) in person
{
    print("key = \(key) value = \(value)")
}


