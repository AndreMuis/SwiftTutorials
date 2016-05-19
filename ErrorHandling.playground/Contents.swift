//: Playground - noun: a place where people can play

import UIKit

enum ParameterError : ErrorType
{
    case NotSpecified
    case Invalid
}

enum FileError : ErrorType
{
    case TooShort
    case TooLong
}

func processFileWithName(fileName : String?) throws -> String
{
    if let someFileName = fileName
    {
        if someFileName != ""
        {
            if someFileName.characters.count <= 3
            {
                throw FileError.TooShort
            }
            else if someFileName.characters.count >= 10
            {
                throw FileError.TooLong
            }
            else
            {
                return "Processed File Contents"
            }
        }
        else
        {
            throw ParameterError.Invalid
        }
    }
    else
    {
        throw ParameterError.NotSpecified
    }
}


do
{
    let contents : String = try processFileWithName("butterfly")
}
catch let error
{
    print(error)
}


do
{
    let contents : String = try processFileWithName("")
}
catch let error
{
    print(error)
}


do
{
    let contents : String = try processFileWithName("me")
}
catch let error as ParameterError
{
    print(error)
}
catch let error as FileError
{
    print(error)
}
catch let error
{
    print(error)
}



// Optional Error Handling

if let contents : String = try? processFileWithName("me")
{
    print ("no error returned")
}
else
{
    print ("error returned")
}

// error: let contents2 : String = try! processFileWithName("me")



// Guard

enum MathError : ErrorType
{
    case DivideByZero
    case Overflow
}

var validationPassedCount : Int = 0
var history : [(Float, Float)] = []

func divideX(x : Float, y : Float) throws -> Float
{
    defer
    {
        history.append((x, y))
    }
    
    guard y != 0.0 else
    {
        throw MathError.DivideByZero
    }
    
    validationPassedCount += 1
    
    return x / y;
}


do
{
    try divideX(3.0, y: 4.0)
}
catch let error as MathError
{
    print(error)
}

validationPassedCount
history


do
{
    try divideX(1.0, y: 0.0)
}
catch let error as MathError
{
    print(error)
}

validationPassedCount
history






















