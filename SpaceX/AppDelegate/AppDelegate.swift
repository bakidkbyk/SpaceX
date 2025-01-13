//
//  AppDelegate.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = ViewController()
        return true
    }
}

