import UIKit

// computed properties

extension Double {
    var km: Double { return self * 1000.0 }
}

print("\(1.23.km) meters")

// initializers

struct Circle {
    let radius: Double
}

extension Circle {
    init(circumference: Double) {
        self.init(radius: circumference / (2.0 * Double.pi))
    }
}

let circle = Circle(circumference: 10.0)
print(circle.radius)

// methods

class SomeClass {
}

extension SomeClass {
    func printHello() {
        print("hello")
    }
}

let someInstance = SomeClass()
someInstance.printHello()

// mutating instance methods

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)

// subscripts

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1

        for _ in 0..<digitIndex {
            decimalBase *= 10
        }

        return (self / decimalBase) % 10
    }
}

print(1234[1])

// nested types

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

let num = -1
print(num.kind)
