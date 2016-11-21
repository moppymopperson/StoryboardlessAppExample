//
//  AppDelegate.swift
//  StoryboardlessViewAndController
//
//  Created by Erik Hornberger on 2016/11/21.
//  Copyright © 2016年 EExT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // View controller initialized from code can have custom initializers that make testing easier.
        let viewController = CodeOnlyViewController(word: "TEST")
        
        // If you don't want to use a storyboard, you need to delete the storyboard and remove the storyboard name entry from Info.plist
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

