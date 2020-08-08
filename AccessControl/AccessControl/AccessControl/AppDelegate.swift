//
//  AppDelegate.swift
//  AccessControl
//
//  Created by user176866 on 8/7/20.
//

import UIKit
import SomeFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var trackedString = TrackedString()
        trackedString.value = "a"
        trackedString.value = "b"
        trackedString.value = "c"
        
        print(trackedString.numberOfEdits)
        
        return true
    }
}
