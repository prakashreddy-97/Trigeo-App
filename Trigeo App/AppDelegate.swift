//
//  Trigeo App
//
//  Created by Mahesh on 20/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
let APPLICATION_ID = "FD35DDB9-39C2-1559-FF3C-6E24001E2A00"
let API_KEY = "0B124826-FA6F-50DE-FF64-5A1A3D7CCD00"
let SERVER_URL = "https://api.backendless.com"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var backendless = Backendless.sharedInstance()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        backendless?.hostURL = SERVER_URL
        backendless?.initApp(APPLICATION_ID, apiKey: API_KEY)
        // Override point for customization after application launch.
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

