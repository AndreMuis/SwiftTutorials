//: Playground - noun: a place where people can play

import UIKit


// Overloading

struct BodyParts
{
    var people : [String] = ["Andre", "Lottie", "Jake"]
    var parts : [String] = ["head", "arms", "feet"]
    
    subscript(personIndex : Int) -> String
    {
        get
        {
            return self.people[personIndex]
        }
        
        set
        {
            if (personIndex < self.people.count)
            {
                self.people[personIndex] = newValue
            }
        }
    }
    
    subscript(personIndex : Int, partIndex : Int) -> (String, String)
    {
        get
        {
            return (self.people[personIndex], self.parts[partIndex])
        }
    }
}


var bodyParts : BodyParts = BodyParts()

bodyParts[0]

bodyParts.people
bodyParts[2] = "Ted"
bodyParts.people


bodyParts[0, 1]





