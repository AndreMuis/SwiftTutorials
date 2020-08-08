//
//  SomeFrameworkClass.swift
//  SomeFramework
//
//  Created by user176866 on 8/7/20.
//

import UIKit

// open allows for subclassing in other modules
open class SomeFrameworkClass: NSObject {
}

public struct TrackedString {
    public private(set) var numberOfEdits = 0
 
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}
