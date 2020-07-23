import UIKit

// initializing an empty string

let emptyString = ""

if emptyString.isEmpty {
    print("string is empty")
}

// working with characters

let name = "Andre"
for character: Character in name {
    print(character)
}
 
// counting characters

print("\(name.count)")

// string indices

let text = "matrix"

print(text[text.startIndex])
print(text[text.index(before: text.endIndex)])
print(text[text.index(after: text.startIndex)])
print(text[text.index(text.startIndex, offsetBy: 2)])

for index in text.indices {
    print(text[index])
}

var letters = "abcde"

letters.insert("x", at: letters.index(letters.startIndex, offsetBy: 2))
print(letters)

letters.insert(contentsOf: "xyz", at: letters.endIndex)
print(letters)

letters.remove(at: letters.startIndex)
print(letters)

var range = letters.index(letters.endIndex, offsetBy: -3)..<letters.endIndex
letters.removeSubrange(range)
print(letters)

// substrings

letters = "abcdef"
range = letters.startIndex..<letters.index(letters.startIndex, offsetBy: 3)
print(letters[range])

// prefix and suffix equality

letters = "abcmmmxyz"

print(letters.hasPrefix("abc"))
print(letters.hasSuffix("xyz"))
