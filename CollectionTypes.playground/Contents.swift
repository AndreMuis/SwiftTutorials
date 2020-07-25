import UIKit

// creating an empty array

var nums = [Int]()

nums.append(3)
print(nums)

nums = []
print(nums)

// creating an array with a default value

nums = Array(repeating: 10, count: 3)
print(nums)

// accessing and modifying an array

print(nums.count)

nums = []
if nums.isEmpty {
    print("nums is empty")
} else {
    print("nums is not empty")
}

nums.append(100)
print(nums)

nums += [30, 40]
print(nums)

nums[0...1] = [11, 12]
print(nums)

nums.insert(-1, at: 0)
print(nums)

nums.remove(at: 3)
print(nums)

// iterating over an array

let cars = ["Honda", "Mercedes", "BMW"]

for (index, value) in cars.enumerated() {
    print("\(index) \(value)")
}

// creating and initializing an empty set

var someSet = Set<Character>()

someSet.insert("a")
print(someSet)

someSet = []
print(someSet)

// creating a set with an array literal

var anotherSet: Set<Character> = ["x", "y", "z"]
print(anotherSet)

// accessing and modifying a set

print(anotherSet.count)

if anotherSet.isEmpty {
    print("another set is empty")
} else {
    print("another set is not empty")
}

anotherSet.insert("w")
print(anotherSet)

anotherSet.remove("z")
print(anotherSet)

print(anotherSet.contains("x"))

// iterating over a set

for someCharacter in anotherSet.sorted() {
    print(someCharacter)
}

// fundamental set operations

let firstSet: Set<Int> = [1, 2, 3, 4]
let secondSet: Set<Int> = [3, 4, 5, 6]

print(firstSet.union(secondSet).sorted())
print(firstSet.intersection(secondSet))
print(firstSet.symmetricDifference(secondSet).sorted())
print(firstSet.subtracting(secondSet).sorted())

// set membership and equality

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(houseAnimals.isDisjoint(with: cityAnimals))

// creating an empty dictionary

var someDict = [String: String]()

someDict["name"] = "Andre"
print(someDict)

someDict = [:]
print(someDict)

// creating a dictionary with a dictionary literal

var person: [String: String] = ["first": "Andre", "last": "Muis", "race": "White"]
print(person)

// accessing and modifying a dictionary

print(person.count)
print(person.isEmpty)

person["last"] = "Henderson"
print(person)

person["last"] = nil
print(person)

// iterating over a dictionary

for (key, value) in person {
    print("\(key) \(value)")
}

print(person.keys)
print(person.values)



