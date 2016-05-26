//: Playground - noun: a place where people can play

import UIKit


// Overriding Methods

class Plant
{
    func description() -> String
    {
        return "Plant"
    }
}

class Flower : Plant
{
    override func description() -> String
    {
        return super.description() + " : Flower"
    }
}

let rose : Flower = Flower()
rose.description()



// Overriding Properties

class Candy
{
    var name : String = ""
    
    final var sugar : Float
    {
        get
        {
            return 0.0;
        }
    }
    
    var description : String = "candy"
    
    var color : String
    {
        get
        {
            return "white"
        }
        
        set
        {
            self.description = newValue + " candy"
        }
    }
    
    var shape : String = ""
    {
        willSet
        {
            print("Candy : willSet")
        }
        
        didSet
        {
            print("Candy : didSet")
        }
    }
}

class JellyBean : Candy
{
    // error: override let name : String = ""
    
    // error:
    // override var sugar : Float
    // {
    //     get
    //     {
    //         return 5.0;
    //     }
    // }
    
    override var color : String
    {
        get
        {
            return "red"
        }
        
        set
        {
            self.description = newValue + " jelly bean"
        }
    }
    
    override var shape : String
    {
        willSet
        {
            print("Jelly Bean : willSet")
        }
        
        didSet
        {
            print("Jelly Bean : didSet")
        }
    }
}


var candy : Candy = Candy()

var jellyBean : JellyBean = JellyBean()


candy.color
jellyBean.color


candy.color = "blue"
candy.description

jellyBean.color = "red"
jellyBean.description


print()

candy.shape = "sphere"

print()

jellyBean.shape = "ellipsoid"





