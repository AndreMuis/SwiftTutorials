//: Playground - noun: a place where people can play

import UIKit


// Custom Initializers

class Animal
{
    var type : String
    
    init(type : String)
    {
        self.type = type
    }
}

let animal : Animal = Animal(type: "cat")

animal.type

class Car
{
    var model : String
    
    init(_ model : String)
    {
        self.model = model
    }
}

let car : Car = Car("BMW")

car.model



// Optional Values

class Tree
{
    var type1 : String = "tree"
    var type2 : String?
    var type3 : String!
}

let tree : Tree = Tree()

tree.type1
tree.type2
tree.type3

// error: tree.type1 = nil
print(tree.type1)

tree.type1 = "maple"
print(tree.type1)


tree.type2 = nil
print(tree.type2)

tree.type2 = "maple"
print(tree.type2)


tree.type3 = nil
// error: print(tree.type3!)

tree.type3 = "maple"
print(tree.type3)



// Memberwise Initializers

struct Fruit
{
    var name : String
}

// error: let pear = Fruit()
let apple = Fruit(name: "apple")


struct Vegetable
{
    var name : String = "vegetable"
}

let carrot = Vegetable() // default initializer
let tomato = Vegetable(name: "tomato") // memberwise initializer



// Initializer Delegation

struct Meat
{
    var weight : Float = 0.0
    var color : String = ""
    var quality : Int = 0
   
    init(weight : Float)
    {
        self.weight = weight / 100.0;
    }
    
    init(weight : Float, color : String)
    {
        self.init(weight: weight)
        
        self.color = color
    }
}

// error: let pork = Meat()


let ham = Meat(weight: 100.0)

ham.weight
ham.color
ham.quality


let bacon = Meat(weight: 200.0 , color: "red")

bacon.weight
bacon.color
bacon.quality


// error: let beef = Meat(weight: 0.0 , color: "red" , quality: 1)



// Designated and Convenience Initializers

class Person
{
    init()
    {
    }
}

class Employee : Person
{
    var name : String
    var dateOfBirth : NSDate
    var age : Int
    
    // designated initializer
    init(name : String, dateOfBirth : NSDate, age : Int)
    {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.age = age

        super.init()
    }
    
    // convenience initializer
    convenience init(name : String, dateOfBirth : NSDate)
    {
        let calendar : NSCalendar? = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let components = calendar!.components(NSCalendarUnit.Year, fromDate: dateOfBirth, toDate: NSDate(), options: [])
        
        let age : Int = components.year
        
        self.init(name: name, dateOfBirth: dateOfBirth, age: age)
    }
}

let calendar : NSCalendar? = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

let dateOfBirth : NSDate?  = calendar!.dateWithEra(2000, year: 1974, month: 3, day: 2, hour: 0, minute: 0, second: 0, nanosecond: 0)

let employee : Employee = Employee(name: "Andre", dateOfBirth: dateOfBirth!)

employee.name
employee.dateOfBirth
employee.age



// Initializer Inhertitance

class Hardware
{
    var description : String = ""
    
    init()
    {
    }
    
    init(description : String)
    {
        self.description = description
    }
    
    convenience init(manufacturer : String, model : String)
    {
        self.init(description: manufacturer + " " + model)
    }
}

class Phone : Hardware
{
}

class Tablet : Hardware
{
    override init(description: String)
    {
        super.init(description: description + " (tablet)" )
    }
}

class Watch : Hardware
{
    override init()
    {
        super.init()
    }

    override init(description: String)
    {
        super.init(description: description + " (tablet)" )
    }
}

Phone()
Phone(description: "iPhone")
Phone(manufacturer: "Apple", model: "6s")

Tablet(description: "tablet")

Watch()
Watch(description: "Apple Watch")
Watch(manufacturer: "Apple", model: "2")



// Required Initializers

class Tool
{
    var name : String
    
    init()
    {
        self.name = ""
    }
    
    required init(name : String)
    {
        self.name = name
    }
}

class Hammer : Tool
{
    override init()
    {
        super.init()
    }
    
    required init(name : String)
    {
        super.init(name: name)
    }
}



// Failable Initializers

class Map
{
    var numberOfCountries : Int
    
    init()
    {
        self.numberOfCountries = 0
    }
    
    init?(numberOfCountries : Int)
    {
        if (numberOfCountries <= 0 || numberOfCountries > 196)
        {
            return nil
        }
        
        self.numberOfCountries = numberOfCountries
    }
}

class ContinentMap : Map
{
    override init()
    {
        super.init()
    }
    
    override init?(numberOfCountries : Int)
    {
        if (numberOfCountries <= 0 || numberOfCountries > 54)
        {
            return nil
        }
        
        super.init(numberOfCountries: numberOfCountries)
    }
}

var continentMap : ContinentMap? = ContinentMap(numberOfCountries: 100)



// Deinitialization

var daysPassed : Int = 0

class Day
{
    let maximumTemperature : Float = 0.0
    
    deinit
    {
        daysPassed = daysPassed + 1
    }
}

var day1 : Day? = Day()
day1 = nil

var day2 : Day? = Day()
day2 = nil

var day3 : Day? = Day()
day3 = nil

daysPassed











