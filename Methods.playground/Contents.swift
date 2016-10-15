import Foundation


// Mutating Methods

struct Building
{
    var height : Float = 100.0
    
    mutating func changeHeight(delta : Float)
    {
        self.height += delta
    }
}

var library : Building = Building(height: 100.0)

library.changeHeight(delta: 50.0)
library.height



// Type Methods

struct Spider
{
    static let numberOfLegs : Int = 8
    static let numberOfEyes : Int = 2
    
    static func baseCharacteristics() -> String
    {
        return "number of legs = \(self.numberOfLegs), number of eyes = \(self.numberOfEyes)"
    }
}

class IPhone
{
    static func description() -> String
    {
        return "iOS device"
    }
}

Spider.baseCharacteristics()

IPhone.description()













