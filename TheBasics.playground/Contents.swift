import UIKit

// integer bounds

print(Int.min)
print(Int.max)

// numeric literals

let binaryInteger = 0b0011
print(binaryInteger)

// integer and floating-point conversion

let intNum: Int = 7
print(Double(intNum))

// tuples

let http200Status = (statusCode: 200, description: "OK")
print(http200Status.statusCode)
print(http200Status.description)

// optionals

var someString: String?
print("\(String(describing: someString))")

// optional binding

let someNum: Int? = nil
if let num = someNum {
    print(num)
} else {
    print("someNum is nil")
}

let firstNum: Int? = 10
let secondNum: Int? = 20

if let first = firstNum, let second = secondNum, first < second {
    print("pass")
}

// implicitly unwrapped optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

// assertions (debug build only)

var age = 3
assert(age >= 0, "Age must be greater than 0")

// preconditions (debug and production builds)

age = -10
precondition(age >= 0, "Age must be greater than 0")

