//: Playground - noun: a place where people can play

import UIKit

func returnNothing()
{
    print("return nothing")
}

returnNothing()


func returnAnimal() -> String
{
    return "cat"
}

returnAnimal()


func getPerson() -> (firstName : String, lastName : String)
{
    return ("Andre", "Muis")
}

let person = getPerson()

person.firstName
person.lastName



// Default Values

func multiplyValue1(value1 : Double = 10.0, value2: Double = 100.0) -> Double
{
    let result : Double = value1 * value2
    
    return result
}

multiplyValue1(2.0, value2: 3.0)

multiplyValue1(2.0)



// Variadic Parameters

func add(list : Int ...) -> Int
{
    var result : Int = 0
    
    for value : Int in list
    {
        result += value
    }
    
    return result
}

add(1, 2, 3)



// In-Out Parameters

func uppercase1(array : [String])
{
    // for index in 0 ..< array.count
    // {
    //    error: array[index] = array[index].uppercaseString
    // }
}

func uppercase2(inout array : [String])
{
    for index in 0 ..< array.count
    {
        array[index] = array[index].uppercaseString
    }
}

var names : [String] = ["Andre", "Lottie", "Jake"]

uppercase2(&names)



// Returning Types

func increment(value : Int) -> Int
{
    let result : Int = value + 1;
    
    return result;
}

func decrement(value : Int) -> Int
{
    let result : Int = value - 1;
    
    return result;
}

func modifyByOne(increase : Bool) -> (Int) -> Int
{
    let function : (Int) -> Int
    
    if (increase)
    {
        function = increment
    }
    else
    {
        function = decrement
    }
    
    return function
}

var function = modifyByOne(true)
function(5)

function = modifyByOne(false)
function(5)



// Nested Functions

func modifyByTwo(value: Int, increase : Bool) -> Int
{
    func increment(value : Int) -> Int
    {
        let result : Int = value + 2;
        
        return result;
    }
    
    func decrement(value : Int) -> Int
    {
        let result : Int = value - 2;
        
        return result;
    }
    
    let function : (Int) -> Int
    
    if (increase)
    {
        function = increment
    }
    else
    {
        function = decrement
    }
    
    let result : Int = function(value)
    
    return result
}

modifyByTwo(5, increase: true)

modifyByTwo(5, increase: false)











