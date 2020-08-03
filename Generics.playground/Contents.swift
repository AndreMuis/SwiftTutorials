import UIKit

// generic functions

func swap<T>(a: inout T, b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

var num1 = 5
var num2 = 10

swap(&num1, &num2)

print("\(num1) \(num2)")

var string1 = "one"
var string2 = "two"

swap(&string1, &string2)

print("\(string1) \(string2)")

// generic types

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(item: Element) {
        self.items.append(item)
    }
    
    mutating func pop() -> Element {
        return self.items.removeLast()
    }
}

var stack = Stack<Int>()
stack.push(item: 5)
stack.push(item: 6)
stack.push(item: 7)
stack.pop()

print(stack.items)

// extending a generic type

extension Stack {
    var topItem: Element? {
        return self.items.isEmpty ? nil : self.items.last
    }
}

var anotherStack = Stack<String>()
anotherStack.push(item: "apple")
anotherStack.push(item: "banana")

print(anotherStack.topItem ?? "should not be nil")

// type constraints

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let index = findIndex(of: "banana", in: ["apple", "banana", "carrot"])
print(index ?? -1)

// associated types

protocol Container {
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct List<Element>: Container {
    var items = [Element]()
    
    // Item is inferred to be of type Element
    mutating func append(_ item: Element) {
        self.items.append(item)
    }
    
    var count: Int {
        return self.items.count
    }
    
    subscript(i: Int) -> Element {
        return self.items[i]
    }
}

// extending an existing type to specify an associated type

extension Array: Container {}

// adding constraints to an associated type

protocol SomeProtocol {
    associatedtype Item: Equatable
}

// using a protocol in its associated type's constraints

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    
    func suffix(_ size: Int) -> Suffix
}

extension List: SuffixableContainer {
    func suffix(_ size: Int) -> List {
        var result = List()
        
        for index in (self.count - size)..<count {
            result.append(self[index])
        }
        
        return result
    }
}

var listOfInts = List<Int>()
listOfInts.append(10)
listOfInts.append(20)
listOfInts.append(30)

let suffix = listOfInts.suffix(2)
print(suffix)

// generic where clauses

func allItemsMatch<C1: Container, C2: Container>(someContainer: C1, anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable
{
    if someContainer.count != anotherContainer.count {
        return false
    }

    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    return true
}

var listOfStrings = List<String>()
listOfStrings.append("one")
listOfStrings.append("two")
listOfStrings.append("three")

let arrayOfStrings = ["one", "two", "three"]

let result = allItemsMatch(someContainer: listOfStrings, anotherContainer: arrayOfStrings)
print(result)

// extensions with a generic where clause

extension List where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = self.items.last else {
            return false
        }
        
        return item == topItem
    }
}

var list = List<Int>()
list.append(100)

print(list.isTop(100))

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return self.count >= 1 && item == self[0]
    }
}

var anotherList = List<Character>()
anotherList.append("x")
anotherList.append("y")
anotherList.append("z")

print(anotherList.startsWith("x"))

// contextual where clauses

// would not compile

// associated types with a generic where clause

protocol AnotherContainer {
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

// generic subscripts

extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            
            for index in indices {
                result.append(self[index])
            }
            
            return result
    }
}
