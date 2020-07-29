import UIKit

class BaseClass {
    var description: String {
        return "beans"
    }
    
    var name = ""
    
    func someMethod() {
        print("BaseClass")
    }
}

class SubClass: BaseClass {
    override var description: String {
        return super.description + " and rice"
    }
    
    override var name: String {
        didSet {
            print("didSet called")
        }
    }
    
    override func someMethod() {
        super.someMethod()
        
        print("SubClass")
    }
}

// overriding methods

let sub = SubClass()
sub.someMethod()

// overriding property setters and getters

print(sub.description)

// overriding property observers

sub.name = "Andre"

// preventing overrides

class AnotherClass {
    final var count = 0
}

