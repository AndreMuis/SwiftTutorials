//: Playground - noun: a place where people can play

import UIKit


// Protocol Inheritance

protocol Person
{
    var name : String {get}
    
    init(name : String)
    
    func sleep()
}

protocol Employee : Person
{
    var title : String {get set}

    func pay()
}

struct CEO : Employee
{
    var name : String
    var title : String
    
    init(name : String)
    {
        self.name = name
        self.title = ""
    }
    
    func pay()
    {
        print("pay")
    }
    
    func sleep()
    {
        print("sleep")
    }
}



// Protocol Extensions

protocol Dog
{
    var name : String {get}
    var age : Int {get}
    
    func bark() -> String
    func sit() -> String
}

extension Dog
{
    var name : String
    {
        return "Dog"
    }
    
    var age : Int
    {
        return 0
    }

    func bark() -> String
    {
        return "bark (extension)"
    }

    func sit() -> String
    {
        return "sit (extension)"
    }
}

struct Greyhound : Dog
{
    var age : Int
    {
        return 7
    }
    
    func sit() -> String
    {
        return "sit"
    }
}

let greyhound : Greyhound = Greyhound()

greyhound.name
greyhound.age
greyhound.bark()
greyhound.sit()



// Multiple Protocols

protocol Building
{
    var name : String {get}
    var numberOfFloors : Int {get}
}

protocol WiFiCapability
{
    var hasWiFi : Bool {get}
    var numberOfRouters : Int {get}
}

struct WhiteHouse : Building, WiFiCapability
{
    var name : String = "White House"
    var numberOfFloors : Int = 3
    
    var hasWiFi : Bool = true
    var numberOfRouters : Int = 78
}



// Binary Operators

func == (lhs : File, rhs : File) -> Bool
{
    return lhs.name == rhs.name && lhs.contents == rhs.contents
}

protocol File
{
    var name : String {get}
    var contents : String {get}
}

struct PDF : File
{
    init(name : String, contents : String)
    {
        self.name = name
        self.contents = contents
    }
    
    var name : String = ""
    var contents: String = ""
}

let pdf1 = PDF(name: "resume.pdf" , contents: "abc")
let pdf2 = PDF(name: "resume.pdf" , contents: "abc")
let pdf3 = PDF(name: "resume.pdf" , contents: "xyz")

pdf1 == pdf2
pdf1 == pdf3





















