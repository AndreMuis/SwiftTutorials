import Foundation


struct SomeStruct
{
    var message : String
    var count : Int
}

class SomeClass
{
    var name : String = ""
}

let someStruct : SomeStruct = SomeStruct(message: "hi", count: 5)

let someClass : SomeClass = SomeClass()


struct Animal
{
    var name : String
}

let lion : Animal = Animal(name: "Bob")
var tiger : Animal = lion

tiger.name = "Tony"

lion.name
tiger.name


class Car
{
    var model : String = ""
}

let mercedes : Car = Car()
mercedes.model = "240 D"

var bmw : Car = mercedes
bmw.model = "135 i"

mercedes.model
bmw.model


let horse : Animal = Animal(name: "Ed")
// horse.name = "" // error

let mgb : Car = Car()
mgb.model = "212"













