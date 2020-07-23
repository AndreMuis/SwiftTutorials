import UIKit

// assignment operators

let (m, n) = (55, 56)

print(m)
print(n)

// remainder operator

print(4 % 1)
print(4 % 2)
print(4 % 3)
print(4 % 4)

// ternary conditional operator

let question = true
let result = question ? "true" : "false"
print(result)

// nil-coalescing operator

let anOptional: Int? = nil
print(anOptional ?? 100)

// closed range operator

for index in 1...4 {
    print(index)
}

// half-open range operator

for index in 1..<4 {
    print(index)
}

// one-sided ranges

let names = ["John", "Brian", "Sally"]

for name in names[...1] {
    print(name)
}
