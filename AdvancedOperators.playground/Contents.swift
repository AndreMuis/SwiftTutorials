import UIKit

func printAsBinary(num: UInt8) {
    let unpadded = String(num, radix: 2)
    var padded = unpadded
    
    for _ in 0..<(8 - unpadded.count) {
        padded = "0" + padded
    }
    
    print(padded)
}

// bitwise NOT operator

var num: UInt8 = 0b00001111

printAsBinary(num: num)
printAsBinary(num: ~num)

// bitwise AND operator

var num1: UInt8 = 0b00111111
var num2: UInt8 = 0b00111100

var result = num1 & num2
printAsBinary(num: result)

// bitwise OR operator

result = num1 | num2
printAsBinary(num: result)

// bitwise XOR operator

result = num1 ^ num2
printAsBinary(num: result)

// shifting behavior for unsigned intetgers

num = 0b11111111

num1 = num >> 1
printAsBinary(num: num1)

num2 = num << 1
printAsBinary(num: num2)

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF

print(String(redComponent, radix: 16))
print(String(greenComponent, radix: 16))
print(String(blueComponent, radix: 16))

// shifting behavior for signed integers

num = 4
printAsBinary(num: num)

var negativeNum: Int8 = -4
printAsBinary(num: UInt8(bitPattern: negativeNum))

num = num >> 1
printAsBinary(num: num)

negativeNum = negativeNum >> 1
printAsBinary(num: UInt8(bitPattern: negativeNum))

// overflow operators (&+, &-, &*)

num = UInt8.max
printAsBinary(num: num)

num = num &+ 1
printAsBinary(num: num)

// operator methods

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

var vector1 = Vector2D(x: 1.0, y: 10.0)
var vector2 = Vector2D(x: 2.0, y: 20.0)

var vector3 = vector1 + vector2
print("(\(vector3.x), \(vector3.y))")

// equivalence operators

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

vector1 = Vector2D(x: 1.0, y: 2.0)
vector2 = Vector2D(x: 1.0, y: 2.0)

print(vector1 == vector2)

// custom operators

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector.x = vector.x * 2
        vector.y = vector.y * 2
        
        return vector
    }
}

vector3 = +++vector1
print("(\(vector3.x), \(vector3.y))")

