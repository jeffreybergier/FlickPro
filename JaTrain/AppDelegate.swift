//
//  AppDelegate.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootVC = ParentViewController()
        let navVC = UINavigationController(rootViewController: rootVC)

        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window!.backgroundColor = .white
        }

        self.window!.rootViewController = navVC
        self.window!.makeKeyAndVisible()

        return true
    }
}

