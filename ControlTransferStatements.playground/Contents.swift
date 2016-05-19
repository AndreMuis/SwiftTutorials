//: Playground - noun: a place where people can play

import UIKit


for var count in 1...10
{
    if (count % 2 == 1)
    {
        continue
    }
    
    print("count = \(count)")
}

print()

for var count in 1...10
{
    if (count == 6)
    {
        break
    }
    
    print("count = \(count)")
}


var value : Int = 1

switch value
{
case 1:
    print("value = 1")
    fallthrough
    
case 2:
    print("value = 2")
    
default:
    print("something else")
}







