import UIKit

// subscript syntax

class Names {
    var array = ["Fred", "Alex", "Jim"]

    subscript(index: Int) -> String {
        get {
            return self.array[index]
        }
        set {
            array[index] = newValue
        }
    }
}

let names = Names()

print(names[0])

names[2] = "Andre"
print(names[2])

// subscript options

class ZeroMatrix {
    subscript(row: Int, column: Int) -> Int {
        get {
            return 0
        }
    }
}

let matrix = ZeroMatrix()
print(matrix[100, 100])

// type subscripts

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune

    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
