import Foundation


enum ParameterError : Error
{
    case FileNameEmpty
}

enum FileError : Error
{
    case FileNameTooShort
    case FileNameTooLong
}

func processFile(fileName : String) throws -> String
{
    if fileName != ""
    {
        if fileName.characters.count <= 3
        {
            throw FileError.FileNameTooShort
        }
        else if fileName.characters.count >= 10
        {
            throw FileError.FileNameTooLong
        }
        else
        {
            return "Processed File Contents"
        }
    }
    else
    {
        throw ParameterError.FileNameEmpty
    }
}


do
{
    let contents : String = try processFile(fileName: "butterfly")
}
catch let error
{
    print(error)
}


do
{
    let contents : String = try processFile(fileName: "")
}
catch let error
{
    print(error)
}


do
{
    let contents : String = try processFile(fileName: "me")
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

if let contents : String = try? processFile(fileName: "me")
{
    print ("no error returned")
}
else
{
    print ("error returned")
}

// error: let contents2 : String = try! processFile(fileName: "me")



// Guard

enum MathError : Error
{
    case DivideByZero
    case Overflow
}

var validationPassedCount : Int = 0
var history : [(Float, Float)] = []

func divide(x : Float, y : Float) throws -> Float
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
    
    return x / y
}


do
{
    try divide(x: 3.0, y: 4.0)
}
catch let error as MathError
{
    print(error)
}

validationPassedCount
history


do
{
    try divide(x: 1.0, y: 0.0)
}
catch let error as MathError
{
    print(error)
}

validationPassedCount
history






