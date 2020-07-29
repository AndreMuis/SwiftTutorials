import UIKit

// lazy stored properties

class DataImporter {
    var count = 0
    
    init() {
        print("init called")
    }
}

class DataManager {
    lazy var importer = DataImporter()
}

let manager = DataManager()
print("init not yet called")

manager.importer.count = 1

// computed properties

class Circle {
    var radius: Float = 0.0
    
    var circumference: Float {
        get {
            return 2.0 * Float.pi * self.radius
        }
        set (newValue) {
            self.radius = newValue / (2.0 * Float.pi)
        }
    }
}

let circle = Circle()

circle.radius = 3.0
print(circle.circumference)

circle.circumference = 10
print(circle.radius)

// read-only computed properties

class Square {
    var length = 10.0
    
    var area: Double {
        return pow(length, 2)
    }
}

let square = Square()

print(square.area)

// property observers

class Counter {
    var count: Int = 0 {
        willSet (newCount) {
            print("about to set count to \(newCount)")
        }
        didSet {
            print("previous value of count was \(oldValue)")
        }
    }
}

let counter = Counter()
counter.count = 1

// property wrappers

@propertyWrapper
class SmallNumber {
    private var number: Int
    private var maximum: Int
    
    var wrappedValue: Int {
        get {
            return self.number
        }
        set {
            self.number = min(newValue, self.maximum)
        }
    }
    
    init () {
         self.number = 0
         self.maximum = 10
    }
    
    init (wrappedValue: Int) {
        self.maximum = 10
        self.number = min(wrappedValue, self.maximum)
    }
    
    init (wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        self.number = min(wrappedValue, maximum)
    }
}

class SmallCube {
    @SmallNumber var length: Int
    @SmallNumber var width: Int = 9
    @SmallNumber(maximum: 100) var height: Int = 25
}

let cube = SmallCube()

print(cube.length)
cube.length = 11
print(cube.length)

print(cube.width)
cube.width = 11
print(cube.width)

print(cube.height)
cube.height = 101
print(cube.height)

// querying and setting type properties

class SomeClass {
    static var storedTypeProperty = "Andre"
    
    static var computedTypeProperty: Int {
        return 7
    }
} // same for enumerations and structs

print(SomeClass.storedTypeProperty)
print(SomeClass.computedTypeProperty)

SomeClass.storedTypeProperty = "Sam"
print(SomeClass.storedTypeProperty)



