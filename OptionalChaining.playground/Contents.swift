import UIKit

// accessing properties through optional chaining

class Person {
    var residence: Residence? = nil
}

class Residence {
    var rooms = [Room(), Room(), Room()]
    var address = "Some Address"
    
    subscript(index: Int) -> Room {
        get {
            return self.rooms[index]
        }
    }
    
    func printAddress() {
        print("\(self.address)")
    }
}

class Room {
    var type: String = ""
}

let person = Person()

print(person.residence?.address ?? "nil")
person.residence?.address = "hi"
print(person.residence?.address ?? "nil")

// calling methods through optional chaining

print(person.residence?.printAddress() ?? "nil")

// accessing subscripts with optional chaining

print(person.residence?[0].type ?? "nil")

// accessing subscripts of optional type

var testScores = ["Dave": [90, 95, 87], "Sally": [76, 88, 92]]

testScores["Dave"]?[0] = 10
testScores["Brian"]?[0] = 11

print(testScores)

// linking multiple levels of chaining

person.residence = Residence()
print(String(describing: person.residence?.address))


