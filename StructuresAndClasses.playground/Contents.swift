import UIKit

// structures and enumerations are value types

struct Point {
    var x: Int
    var y: Int
}

let point1 = Point(x: 5, y: 10)
var point2 = point1

point2.x = 300

print(point1.x)
print(point2.x)

// classes are reference types

class Person {
    var name: String = ""
    var age: Int = 0
}

let person1 = Person()
person1.name = "Andre"

let person2 = person1
person2.name = "Sam"

print(person1.name)
print(person2.name)

// identity operators

print(person1 === person2)
