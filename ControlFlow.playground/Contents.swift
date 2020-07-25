import UIKit

// for-in loops

for _ in 1...3 {
    print("loop")
}

for count in stride(from: 0, to: 15, by: 5) {
    print(count)
}

// while loops

var count = 0
while (count > 0) {
    print(count)
    count -= 1
}

count = 0
repeat {
    print(count)
    count -= 1
} while(count > 0)

// switch

let someCharacter : Character = "a"
switch (someCharacter) {
case "a", "A":
    print("character is a")
case "b", "B":
    print("character is b")
default:
    print("character not handled")
}

// interval matching

let someNum = 25

switch (someNum) {
case 1...100:
    print("number is in range")
default:
    print("number is out of range")
}

// tuples

let point = (5, 5)

switch (point) {
case (_, 2):
    print("point does not match (_, 2)")
case (-10...10, -10...10):
    print("point in range")
default:
    print("point not handled")
}

// value bindings

switch (point) {
case let (x, y):
    print("\(x) \(y)")
}

// where

switch (point) {
case let (x, y) where x == y:
    print("x = y")
default:
    print("x != y")
}

// control transfer statements

// continue

for index in 1...5 {
    print("index = \(index)")
    if index >= 4 {
        continue
    }
    print("times ten = \(index * 10)")
}

// break

for index in 1...5 {
    print("index = \(index)")
    if index >= 4 {
        break
    }
    print("times ten = \(index * 10)")
}

// fallthrough

let num = 10

switch (num) {
case 10:
    print("num is 10")
    fallthrough
default:
    print("defauit")
}

// early exit

func checkAge(age: Int?) {
    guard let age = age else {
        print("age not provided")
        return
    }
    
    print("age = \(age)")
}

checkAge(age: nil)

// checking API availability

if #available(iOS 10, *) {
    print("can use iOS 10 APIs")
} else {
    print("use APIs earlier then iOS 10")
}
