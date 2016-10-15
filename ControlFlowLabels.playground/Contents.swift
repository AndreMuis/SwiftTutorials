import Foundation


outerLoop: for var outer : Int in 1...4
{
    innerLoop: for var inner : Int in 1...4
    {
        print("\(outer), \(inner)")
        
        if (outer == 2 && inner == 3)
        {
            break outerLoop
        }
    }
}


