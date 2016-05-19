//: Playground - noun: a place where people can play

import UIKit


func swap<T>(inout first : T, inout second : T)
{
    let firstSave : T = first
    
    first = second

    second = firstSave
}

var flavor = "grape"
var size = "large"

swap(&flavor, &size)

flavor
size



struct Stack<T>
{
    var items : [T] = [T]()
    
    mutating func push(item : T)
    {
        self.items.append(item)
    }

    mutating func pop()
    {
        self.items.removeLast()
    }
}

var stack : Stack<String> = Stack<String>()

stack.push("first")
stack.push("second")
stack.push("third")

stack.items

stack.pop()

stack.items



func addHashValues<T : Hashable>(first first : T, second : T) -> Int
{
    return first.hashValue + second.hashValue
}

let breed = "Ragdoll"
breed.hashValue

let spice = "Thyme"
spice.hashValue

addHashValues(first: breed, second: spice)



protocol Queue
{
    associatedtype ItemType
    
    var items : [ItemType] {get}
    
    mutating func enqueue(item : ItemType)
    
    mutating func dequeue() -> ItemType
}

struct PeopleQueue<T> : Queue
{
    var items : [T] = [T]()
    
    mutating func enqueue(item: T)
    {
        self.items.append(item)
    }

    mutating func dequeue() -> T
    {
        return self.items.removeFirst()
    }
}

var ticketQueue : PeopleQueue<Int> = PeopleQueue<Int>()

ticketQueue.enqueue(1)
ticketQueue.enqueue(2)
ticketQueue.enqueue(3)

ticketQueue.items


ticketQueue.dequeue()

ticketQueue.items



func addQueues<T1 : Queue, T2 : Queue where T1.ItemType == T2.ItemType>
    (firstQueue firstQueue : T1, secondQueue : T2) -> [T1.ItemType]
{
    return firstQueue.items + secondQueue.items
}

var foodQueue : PeopleQueue<Int> = PeopleQueue<Int>()

foodQueue.enqueue(10)
foodQueue.enqueue(11)

var tellerQueue : PeopleQueue<Int> = PeopleQueue<Int>()

tellerQueue.enqueue(12)
tellerQueue.enqueue(13)

addQueues(firstQueue: foodQueue, secondQueue: tellerQueue)


























