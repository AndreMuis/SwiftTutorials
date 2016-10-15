import Foundation


class Person
{
    var age : Int?
}

var person : Person = Person()
person.age = 42


if let age = person.age, age > 20
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
