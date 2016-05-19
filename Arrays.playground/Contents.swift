//: Playground - noun: a place where people can play

import UIKit


var array1 : [String] = ["a", "b", "c"]
var array2 : [String] = ["a", "b", "c"]
var array3 : [String] = ["c", "b", "a"]

array1 == array2
array1 == array3


var numbers : [Int] = [1, 2, 3]

numbers[0]
numbers[2]

numbers.count


numbers.append(4)

numbers += [50]

numbers.appendContentsOf([8, 9])


numbers[4] = 5
numbers


numbers.indexOf(3)


numbers.contains(3)
numbers.contains(0)


numbers.insert(0, atIndex: 0)

numbers.insertContentsOf([6, 7], at: 6)


let rangeExclusive = 1..<3
numbers[rangeExclusive]

let rangeInclusive = 1...3
numbers[rangeInclusive]


numbers.replaceRange(1...3, with: [11, 12, 13])


numbers.removeLast()
numbers

numbers.removeAtIndex(0)
numbers

numbers.removeAll()
numbers



// Sorting

numbers = [1, 2, 3]

func reverseSort(item1 : Int, item2 : Int) -> Bool
{
    return item1 > item2
}


numbers.sort(reverseSort)
numbers

numbers.sortInPlace(reverseSort)
numbers


numbers = [1, 2, 3]

numbers.sortInPlace{$1 < $0}
numbers















