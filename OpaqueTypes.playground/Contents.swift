import UIKit

// returning an opaque type

protocol SomeProtocol {
    var value: String { get }
}

struct SomeStruct: SomeProtocol {
    var value: String
}

struct AnotherStruct: SomeProtocol {
    var value: String
}

func methodUsingProtocols(someBool: Bool) -> SomeProtocol {
    if someBool {
        return SomeStruct(value: "")
    } else {
        return AnotherStruct(value: "")
    }
}

func methodUsingOpaqueTypes(someBool: Bool) -> some SomeProtocol {
    if someBool {
        return SomeStruct(value: "value 1")
    } else {
        return SomeStruct(value: "value 2")
    }
}

print(methodUsingProtocols(someBool: true) is SomeStruct)
print(methodUsingProtocols(someBool: false) is AnotherStruct)

print(methodUsingOpaqueTypes(someBool: true) is SomeStruct)
print(methodUsingOpaqueTypes(someBool: false) is SomeStruct)

// differences between opaque types and protocol types

protocol Container {
    associatedtype Item
    
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

extension Array: Container { }

func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}

let opaqueContainer = makeOpaqueContainer(item: 10)
let ten = opaqueContainer[0]

print(type(of: ten))
