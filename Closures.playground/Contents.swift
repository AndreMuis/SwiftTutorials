import Foundation


func printHelloFunction()
{
    print("hello (function)")
}

var printHelloClosure : () -> () =
{
    print("hello (closure)")
}

printHelloFunction()
printHelloClosure()

printHelloClosure = printHelloFunction

printHelloClosure()



// Inline Closures

var combine : (String, String) -> String

combine =
{
    first, second -> String in
    return first + second
}

combine("dog", "house")


combine =
{
    first, second -> String in first + second
}

combine("cat", "house")


combine = {$0 + $1}

combine("white", "house")



// Trailing Closures

let digits : [Int] = [3, 7, 22]

let digitNameMappings : [Int : String] = [1 : "one", 2 : "two", 3 : "three", 4 : "four", 5 : "five", 6 : "six", 7 : "seven", 8 : "eight", 9 : "nine", 0 : "zero"]

let digitNames : [String] = digits.map()
{
    (digit : Int) -> String in
        
    if let digitName : String = digitNameMappings[digit]
    {
        return digitName
    }
    else
    {
        return "unknown"
    }
}

digitNames



// Capture Lists

class Person
{
    var name : String?
    
    lazy var greeting : () -> (String) =
    {
        [unowned self] in
    
        return "Hello, " + self.name!
    }
}

let person : Person = Person()
person.name = "Andre"

person.greeting()



func createIncrementor(incrementAmount : Int) -> () -> Int
{
    var value : Int = 0
    
    func incrementor() -> Int
    {
        value += incrementAmount
        return value
    }
    
    return incrementor
}

let incrementBy5 = createIncrementor(incrementAmount: 5)
incrementBy5()
incrementBy5()
incrementBy5()

let incrementBy1 = createIncrementor(incrementAmount: 1)
incrementBy1()
incrementBy1()

let anotherIncrementBy1 = incrementBy1
incrementBy1()
incrementBy1()















