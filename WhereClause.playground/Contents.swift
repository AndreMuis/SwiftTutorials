//: Playground - noun: a place where people can play

import UIKit


class Person
{
    var age : Int?
}

var person : Person? = Person()
person?.age = 42


if let somePerson = person,
    someAge = somePerson.age
    where someAge > 20
{
    print("success")
}
else
{
    print("failure")
}



print()

let letters : [Character] = ["a", "b", "c", "a", "b", "c", "a", "b"]

for letter in letters where letter == "b"
{
    print(letter)
}
