import UIKit

// ignoring the return value of a function

func calc() -> Int {
    print("running calc")
    return 100
}
				
let _ = calc()

// functions with multiple return values

func getPoint() -> (x: Int, y: Int)? {
    return (2, 3)
}

if let point = getPoint() {
    print("\(point.x) \(point.y)")
}

// specifying argument labels

func someFunc(argumentLabel parameterName: Int) {
    print(parameterName)
}

someFunc(argumentLabel: 101)

// omitting argument labels

func anotherFunction(_ parameterName: Int) {
    print(parameterName)
}

anotherFunction(203)

// default parameter values

func saveInfo(name: String, age: Int = 30) {
    print("\(name) \(age)")
}

saveInfo(name: "Andre", age: 50)
saveInfo(name: "Andre")

// variadic parameters

func calc(numbers: Int...) {
    for number in numbers {
        print(number)
    }
}

calc(numbers: 1, 2, 3)

// in-out parameters

func triple(val: inout Int) {
    val *= 3
}

var num: Int = 3
triple(val: &num)
print(num)

// function types

func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

var operation: (Int, Int) -> Int = add(a:b:)
print(operation(3, 4))

operation = multiply(a:b:)
print(operation(3, 4))
  
// function types as parameter types

func printOperationResult(operation: (Int, Int) -> Int, a: Int, b: Int) {
    print(operation(a, b))
}

printOperationResult(operation: add(a:b:), a: 50, b: 25)

// function types as return types

func getAddOperation() -> (Int, Int) -> Int {
    return add(a:b:)
}

print(getAddOperation()(60, 20))

