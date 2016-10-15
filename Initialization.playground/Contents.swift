import Foundation


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

// tree.type1 = nil // error
print(tree.type1)

tree.type1 = "maple"
print(tree.type1)


tree.type2 = nil
print(tree.type2)

tree.type2 = "maple"
print(tree.type2)


tree.type3 = nil
// print(tree.type3!) // error

tree.type3 = "maple"
print(tree.type3)



// Memberwise Initializers

struct Fruit
{
    var name : String
}

// let pear = Fruit() // error
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

// let pork = Meat // error


let ham = Meat(weight: 100.0)

ham.weight
ham.color
ham.quality


let bacon = Meat(weight: 200.0 , color: "red")

bacon.weight
bacon.color
bacon.quality


// let beef = Meat(weight: 0.0 , color: "red" , quality: 1) // error



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
        let calendar : NSCalendar? = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        
        let components = calendar!.components(NSCalendar.Unit.year, from: dateOfBirth as Date, to: NSDate() as Date, options: [])
        
        let age : Int = components.year!
        
        self.init(name: name, dateOfBirth: dateOfBirth, age: age)
    }
}

let calendar : NSCalendar? = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)

let dateOfBirth : NSDate?  = calendar!.date(era: 2000, year: 1974, month: 3, day: 2, hour: 0, minute: 0, second: 0, nanosecond: 0) as NSDate?

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
    
    convenience init(type : String, model : String)
    {
        self.init(description: type + " " + model)
    }
}

class Phone : Hardware
{
}

class Tablet : Hardware
{
    override init(description: String)
    {
        super.init(description: description)
        
        self.description += " (tablet)"
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
        super.init(description: description)

        self.description += " (watch)"
    }
}

var phone : Phone = Phone()
phone.description

phone = Phone(description: "iPhone 6 Plus")
phone.description

phone = Phone(type: "iPhone", model: "6 Plus")
phone.description


var tablet : Tablet = Tablet(description: "iPad 2")
tablet.description


var watch : Watch = Watch()

watch = Watch(description: "Apple Watch 2")
watch.description

watch = Watch(type: "Apple Watch", model: "2")
watch.description



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











