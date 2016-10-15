import Foundation


struct PizzaTopping : OptionSet
{
    let rawValue : Int
    
    init(rawValue : Int)
    {
        self.rawValue = rawValue
    }
    
    static let Pepperoni : PizzaTopping = PizzaTopping(rawValue: 1 << 0)
    static let Mushrooms : PizzaTopping = PizzaTopping(rawValue: 1 << 1)
    static let Onions : PizzaTopping = PizzaTopping(rawValue: 1 << 2)
}


let pizzaToppings : [PizzaTopping] = [PizzaTopping.Pepperoni, PizzaTopping.Mushrooms]


if pizzaToppings.contains(PizzaTopping.Pepperoni)
{
    print("contains pepperoni")
}




