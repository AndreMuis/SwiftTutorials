import Foundation


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
            return 0.0
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
            print("Candy: shape willSet")
        }
        
        didSet
        {
            print("Candy: shape didSet")
        }
    }
}

class JellyBean : Candy
{
    // override var name : String = "" // error
    
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
            print("Jelly Bean: shape willSet")
        }
        
        didSet
        {
            print("Jelly Bean: shape didSet")
        }
    }
}


var candy : Candy = Candy()

var jellyBean : JellyBean = JellyBean()


candy.color
jellyBean.color


candy.color = "blue"
candy.description

jellyBean.color = "green"
jellyBean.description


print()

candy.shape = "sphere"

print()

jellyBean.shape = "ellipsoid"






