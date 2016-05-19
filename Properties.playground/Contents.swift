//: Playground - noun: a place where people can play

import UIKit


// Computed Properties

struct Person
{
    var height : Float
    var weight : Float
    var bmi : Float
        {
        get
        {
            return self.weight / pow(self.height, 2.0)
        }
        set (newBMI)
        {
            self.weight = newBMI * pow(self.height, 2.0)
        }
    }
}

var person : Person = Person(height: 2, weight: 100)

person.height
person.weight
person.bmi

person.bmi = 20

person.height
person.weight
person.bmi



// Property Observers

struct Employee
{
    var name : String
        {
        willSet(newName)
        {
            print("willSet: current name = \(self.name), new name = \(newName)")
        }
        
        didSet(oldName)
        {
            print("didSet: current name = \(self.name), old name = \(oldName)")
        }
    }
    
    var age : Int
}

var employee : Employee = Employee(name: "Andre", age: 40)
employee.name = "Jake"



// Type Properties

struct Vegetable
{
    static var name : String = "Vegetable"
}

class Fruit
{
    static var name : String = "Fruit"
}

Vegetable.name
Fruit.name













