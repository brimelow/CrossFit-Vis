//
//  AppDelegate.swift
//  Vis
//
//  Created by Lee Brimelow on 12/30/15.
//  Copyright © 2015 Lee Brimelow. All rights reserved.
//

import UIKit
//import HockeySDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        BITHockeyManager.sharedHockeyManager().configureWithIdentifier("521c461016174ca2b9be14a2fbd945a2")
//        // Do some additional configuration if needed here
//        BITHockeyManager.sharedHockeyManager().startManager()
//        BITHockeyManager.sharedHockeyManager().authenticator.authenticateInstallation()

        window?.tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics:UIBarMetrics.Default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().translucent = true
        UINavigationBar.appearance().barStyle = UIBarStyle.Black

        let bgColor = UIColor.init(patternImage: UIImage(named: "bg")!)
        window?.backgroundColor = bgColor
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

