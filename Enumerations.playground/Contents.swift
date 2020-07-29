import UIKit

// enumeration syntax

enum Sex {
    case male
    case female
}

let sex = Sex.male

// matching enumeration values with a switch statement

switch sex {
case .male:
    print("male")
case .female:
    print("female")
}

// iterating over enumeration cases

enum DogBreeds: CaseIterable {
    case SaintBernard
    case Poodle
    case GermanShepard
}

for breed in DogBreeds.allCases {
    print(breed)
}

// associated values

enum BarCode {
    case upc(Int)
    case qrCode(String)
}

let barCode = BarCode.upc(123)

switch barCode {
case .upc(let num):
    print(num)
case .qrCode(let code):
    print(code)
}

// raw values

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
}

// implicitly assigned raw values

enum OrdinalNumber: Int {
    case first = 1, second, third
}

print(OrdinalNumber.second.rawValue)

enum Pets: String {
    case cat = "cat"
    case dog = "dog"
}

print(Pets.cat.rawValue)

// initializing from a raw value

if let pet = Pets(rawValue: "dog") {
    print(pet.rawValue)
}

// recursive enumerations

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
}

let four = ArithmeticExpression.number(4)
let five = ArithmeticExpression.number(5)

let sum = ArithmeticExpression.addition(four, five)

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(expression: left) + evaluate(expression: right)
    }
}

print(evaluate(expression: sum))
