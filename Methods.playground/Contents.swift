import UIKit

// modifying value types from within instance methods

struct Point {
    var x: Int = 0
    var y: Int = 0
    
    mutating func moveBy(deltaX: Int, deltaY: Int) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point()
point.moveBy(deltaX: 3, deltaY: 4)

print(point.x)
print(point.y)

// assigning to self within a mutating method

struct AnotherPoint {
    var x: Int = 0
    var y: Int = 0
    
    mutating func moveBy(deltaX: Int, deltaY: Int) {
        self = AnotherPoint(x: x + deltaX, y: y + deltaY)
    }
}

var anotherPoint = AnotherPoint()
anotherPoint.moveBy(deltaX: 10, deltaY: 20)

print(anotherPoint.x)
print(anotherPoint.y)

enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.off
ovenLight.next()
print(ovenLight)

// type methods

class SomeClass {
    class func printHello() {
        print("hello")
    }
}

SomeClass.printHello()

