import UIKit

// ARC in action

class SomeClass {
    deinit {
        print("deinit")
    }
}

var reference1: SomeClass? = SomeClass()

var reference2 = reference1
var reference3 = reference1

reference3 = nil
print("still allocated")

reference2 = nil
print("still allocated")

reference1 = nil

// weak references

class Person {
    var apartment: Apartment?
    
    deinit {
        print("Person is being deinitialized")
    }
}

class Apartment {
    // Person has to be optional
    weak var tenant: Person?
    
    deinit {
        print("Apartment is being deinitialized")
    }
}

var person: Person? = Person()
var apartment: Apartment? = Apartment()

person?.apartment = apartment
apartment?.tenant = person

print("setting person to nil")
person = nil

print("setting apartment to nil")
apartment = nil

// unowned references

class Customer {
    var creditCard: CreditCard?
    
    deinit {
        print("Customer is being deinitialized")
    }
}

class CreditCard {
    unowned let customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
    }
    
    deinit {
        print("CreditCard is being deinitialized")
    }
}

var customer: Customer? = Customer()
customer?.creditCard = CreditCard(customer: customer!)

customer = nil

// unowned optional references

// - you are responsible for setting any unowned optional references to nil

// unowned references and implicitly unwrapped optional properties

// - both properties have a value and neither property can be nil

class Country {
    let name: String
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

let country = Country(name: "USA", capitalName: "Washington, D.C.")

// resolving strong reference cycles for closures

// - Define a capture in a closure as an unowned reference when the closure and the instance it captures will always refer to each other, and will always be deallocated at the same time.
//
// - Define a capture as a weak reference when the captured reference may become nil at some point in the future.

class SomeDelegate {
}

class AnotherClass {
    var delegate: SomeDelegate?
    
    lazy var someProperty: () -> String = {
        [unowned self, weak delegate = self.delegate] in // capture list
            return "closure called"
    }
    
    deinit {
        print("AnotherClass is being deinitialized")
    }
}

var someInstance: AnotherClass? = AnotherClass()

print(someInstance?.someProperty() ?? "error: closure not called")

someInstance = nil
