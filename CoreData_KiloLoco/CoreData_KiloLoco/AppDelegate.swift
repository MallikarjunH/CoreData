//
//  AppDelegate.swift
//  CoreData_KiloLoco
//
//  Created by mallikarjun on 09/08/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

 
}

