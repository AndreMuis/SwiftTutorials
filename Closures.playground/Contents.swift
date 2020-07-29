import UIKit

// closure expression syntax

let names = ["Jane", "Bob", "Sam"]

var sortedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    s1 < s2
})

print(sortedNames)

sortedNames = names.sorted(by: { $0 < $1 })

print(sortedNames)

// trailing closures

func someFunc(closure: () -> Void) {
    closure()
}

someFunc {
    print("hello")
}

// capturing values

func makeIncremeter(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncremeter(forIncrement: 10)

print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

// escaping closures

var completionHandlers = [() -> Void]()

func anotherFunc(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
    
anotherFunc {
    print("hello")
}

completionHandlers[0]()

// autoclosures

var cars = ["Honda", "BMW", "Ford"]

let carProvider: (() -> String) = { cars.remove(at: 0) }

print(cars.count)
carProvider()
print(cars.count)

print(cars)

func removeCar(car carProvider: @autoclosure () -> String ) {
    print("removed \(carProvider())")
}

removeCar(car: cars.remove(at: 0))

