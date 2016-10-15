import Foundation


// Raw Values

enum CompassDirection : String
{
    case North = "North"
    case South = "South"
    case East = "East"
    case West = "West"
}

let facingDirection : CompassDirection = CompassDirection.East

switch facingDirection
{
case .North:
    print("\(facingDirection.rawValue)")

case .South:
    print("\(facingDirection.rawValue)")

case .East:
    print("\(facingDirection.rawValue)")

case .West:
    print("\(facingDirection.rawValue)")
}


let direction : CompassDirection = CompassDirection(rawValue: "South")!
direction.rawValue



// Associated Values

enum EnumerationType
{
    case value1(Int)
    case value2(String)
    case value3(Int, String)
}

var someEnumeration : EnumerationType = EnumerationType.value3(1, "cat")

someEnumeration = EnumerationType.value3(2, "dog")

switch someEnumeration
{
case let .value1(someInteger):
    print("\(someInteger)")
    
case let .value2(someString):
    print(someString)
    
case let .value3(someInteger, someString):
    print("\(someInteger) \(someString)")
}



// Recursive Enumerations

enum Flavor
{
    case Vanillla
    case Chocolate
    case Strawberry
    
    indirect case TwoFlovors(Flavor, Flavor)
    indirect case ThreeFlovors(Flavor, Flavor)
}

let flavor : Flavor = Flavor.TwoFlovors(Flavor.Vanillla, Flavor.Chocolate)





