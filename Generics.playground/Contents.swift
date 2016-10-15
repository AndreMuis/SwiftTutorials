import Foundation


func swap<T>(first : inout T, second : inout T)
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

    mutating func pop() -> T?
    {
        let last : T? = self.items.removeLast()
        
        return last
    }
}

var stack : Stack<String> = Stack<String>()

stack.push(item: "first")
stack.push(item: "second")
stack.push(item: "third")

stack.items

stack.pop()

stack.items



func subtractHashValues<T : Hashable>(first : T, second : T) -> Int
{
    return first.hashValue - second.hashValue
}

let breed = "Ragdoll"
breed.hashValue

let spice = "Thyme"
spice.hashValue

subtractHashValues(first: breed, second: spice)



protocol Queue
{
    associatedtype ItemType
    
    var items : [ItemType] {get}
    
    mutating func enqueue(item: ItemType)
    
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

ticketQueue.enqueue(item: 1)
ticketQueue.enqueue(item: 2)
ticketQueue.enqueue(item: 3)

ticketQueue.items


ticketQueue.dequeue()

ticketQueue.items



func addQueues<T1 : Queue, T2 : Queue>
    (firstQueue : T1, secondQueue : T2) -> [T1.ItemType] where T1.ItemType == T2.ItemType
{
    return firstQueue.items + secondQueue.items
}

var foodQueue : PeopleQueue<Int> = PeopleQueue<Int>()

foodQueue.enqueue(item: 10)
foodQueue.enqueue(item: 11)

var tellerQueue : PeopleQueue<Int> = PeopleQueue<Int>()

tellerQueue.enqueue(item: 12)
tellerQueue.enqueue(item: 13)

addQueues(firstQueue: foodQueue, secondQueue: tellerQueue)


























