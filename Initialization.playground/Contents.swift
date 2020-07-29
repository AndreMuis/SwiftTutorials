import UIKit

// intializer delegation for value types

struct SomeStruct {
    var name = ""
    
    init(name: String) {
        self.name = name
    }
    
    init(first: String, last: String) {
        self.init(name: "\(first) \(last)" )
    }
}

var someStruct = SomeStruct(name: "Andre")
print(someStruct.name)

someStruct = SomeStruct(first: "Sam", last: "Jones")
print(someStruct.name)

// initializer inheritance and overriding

class Vehicle {
    var numberOfWeels = 0
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        
        self.numberOfWeels = 2
    }
}

let bicycle = Bicycle()
print(bicycle.numberOfWeels)

class HoverBoard: Vehicle {
    var color: String
    
    init(color: String) {
        self.color = color
        
        // self.init() implicity called here
    }
}

let hoverboard = HoverBoard(color: "red")
print(hoverboard.numberOfWeels)

// designated and convenience intializers in action

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[unknown]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneUnknownItem = RecipeIngredient()
let oneOnion = RecipeIngredient(name: "onion")
let fivePotatoes = RecipeIngredient(name: "potato", quantity: 5)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "onion"),
    ShoppingListItem(name: "potato", quantity: 5)
]

breakfastList[0].name = "soda"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}

// failable initializers

struct Animal {
    let species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        
        self.species = species
    }
}

let anonymousAnimal = Animal(species: "")

if anonymousAnimal == nil {
    print("Animal failed to initialize")
}

// propagation of initialization failure

class Product {
    let name: String
    
    init?(name: String) {
        if name.isEmpty { return nil }
        
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    
    init?(name: String, quantity: Int) {
        if quantity <= 0 { return nil}
        
        self.quantity = quantity
        
        super.init(name: name)
    }
}

let oneUnnamed = CartItem(name: "", quantity: 1)
print(oneUnnamed == nil)

let zeroPants = CartItem(name: "pants", quantity: 0)
print(zeroPants == nil)

let threeBelts = CartItem(name: "belt", quantity: 3)
print(threeBelts == nil)

// overriding a failable initializer

class SomeBaseClass {
    var name: String?
    
    init() {
    }
    
    init?(name: String) {
        if name.isEmpty { return nil }
    
        self.name = name
    }
}

class SomeSubClass: SomeBaseClass {
    override init(name: String) {
        super.init()
        
        if name.isEmpty {
            self.name = "[name not provided]"
        } else {
            self.name = name
        }
    }
}

let sub = SomeSubClass(name: "")
print(sub.name ?? "name should not be nil")

class AnotherSubClass: SomeBaseClass {
    override init() {
        super.init(name: "[untitled]")!
    }
}

let another = AnotherSubClass()
print(another.name ?? "name should not be nil")

// required initializers

class Laptop {
    required init() {
    }
}

class MacBook: Laptop {
    required init() {
    }
}

// setting a default property value with a closure or function

class Zoo {
    let animals: [String] = {
        var temporaryAnimals = ["zebra", "lion", "elephant"]
        return temporaryAnimals
    }()
}

let zoo = Zoo()
print(zoo.animals)
