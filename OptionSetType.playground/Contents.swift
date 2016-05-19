//: Playground - noun: a place where people can play

import UIKit


struct PizzaTopping : OptionSetType
{
    let rawValue : Int
    
    init(rawValue : Int)
    {
        self.rawValue = rawValue
    }
    
    static let Pepperoni = PizzaTopping(rawValue: 1)
    static let Mushrooms = PizzaTopping(rawValue: 2)
    static let Onions = PizzaTopping(rawValue: 3)
}


let pizzaToppings = [PizzaTopping.Pepperoni, PizzaTopping.Mushrooms]


PizzaTopping() == PizzaTopping.Pepperoni



