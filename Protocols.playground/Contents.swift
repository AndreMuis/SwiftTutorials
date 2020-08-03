import UIKit

// property syntax

protocol SomeProtocol {
    var someProperty: Int { get set }
    static var someTypeProperty: Int { get }
    
    func someMethod() -> Int
    mutating func someMutatingMethod()
}

// property requirements

protocol FullyNamed {
    var fullName: String { get }
}

class Person: FullyNamed {
    var fullName: String = ""
}

class Starship: FullyNamed {
    var prefix = ""
    var name = ""
    
    var fullName: String {
        return prefix + " " + name
    }
}

// class implementations of protocol initiaiizer requirements

protocol AnotherProtocol {
    init(someParameter: Int)
}

class SomeClass: AnotherProtocol {
    required init(someParameter: Int) {
    }
}

// protocols as types

protocol RandomNumberGenerator {
    func random() -> Double
}

class Dice {
    let randomNumberGenerator: RandomNumberGenerator
    
    init(randomNumberGenerator: RandomNumberGenerator) {
        self.randomNumberGenerator = randomNumberGenerator
    }
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    func random() -> Double {
        return 0.0
    }
}

let dice = Dice(randomNumberGenerator: LinearCongruentialGenerator())

// delegation

protocol Game {
    func play()
}

protocol GameDelegate: AnyObject {
    func gameDidStart(_ game: Game)
}

class DiceGame: Game {
    weak var delegate: GameDelegate?
    
    init(delegate: GameDelegate) {
        self.delegate = delegate
    }
    
    func play() {
        self.delegate?.gameDidStart(self)
    }
}

class DiceGameDelegate: GameDelegate {
    func gameDidStart(_ game: Game) {
        print("game did start")
    }
}

let diceGameDelegate = DiceGameDelegate()
let diceGame = DiceGame(delegate: diceGameDelegate)

diceGame.play()

// adding protocol conformance with an extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension DiceGame: TextRepresentable {
    var textualDescription: String {
        return "a dice game"
    }
}

print(diceGame.textualDescription)

// conditionally conforming to a protocol

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        return self.description
    }
}

let array = [diceGame, diceGame]

print(array.textualDescription)

// adopting a protocol using a synthesized implementation

struct Vector2D: Equatable {
    var x = 0.0
    var y = 0.0
}

print(Vector2D(x: 3, y: 4) == Vector2D(x: 3, y: 4))

// protocol inheritance

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

// class-only protocols

protocol SomeClassOnlyProtocol: AnyObject {
}

// protocol composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Student: Named, Aged {
    var name: String
    var age: Int
}

let student = Student(name: "Andre", age: 46)

func greet(student: Named & Aged) {
    print("hello \(student.name)")
}

greet(student: student)

class Location {
}

class City: Location, Named {
    var name: String = ""
}

func startConcert(city: Location & Named) {
    print(city.name)
}

let city = City()
city.name = "San Jose"

startConcert(city: city)

// checking for protocol conformance

protocol HasArea {
    var area: Double { get }
}

struct Circle: HasArea {
    var area: Double = 0.0
}

let circle: Any = Circle(area: 3.4)

if let circle = circle as? HasArea {
    print("circle has area: \(circle.area)")
}

// optional protocol requirements

@objc protocol DelegateProtocol {
    @objc optional func method1() -> Int
    @objc optional func method2() -> Int
}

class SomeDelegate: NSObject, DelegateProtocol {
    func method1() -> Int {
        return 100
    }
}

let delegate: DelegateProtocol = SomeDelegate()

if let num = delegate.method1?() {
    print(num)
}

if let num = delegate.method2?() {
    print(num)
}

// protocol extensions

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return self.random() > 0.5
    }
}

// providing default implementations

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return self.textualDescription
    }
}

// adding constraints to protocol extensions

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let items = [2, 2, 2, 2]

print(items.allEqual())

