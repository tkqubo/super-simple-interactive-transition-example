//
//  AppDelegate.swift
//  InteractiveTransitionSample
//
//  Created by A12893 on 2014/12/04.
//  Copyright (c) 2014年 Ameba Studio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var rootViewController: UIViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        rootViewController = SourceViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) { }
    func applicationDidEnterBackground(application: UIApplication) { }
    func applicationWillEnterForeground(application: UIApplication) { }
    func applicationDidBecomeActive(application: UIApplication) { }
    func applicationWillTerminate(application: UIApplication) { }
}

