//
//  AppDelegate.swift
//  bearcatconnect
//
//  Created by Verma,Monish on 2/27/17.
//  Copyright © 2017 Verma,Monish. All rights reserved.
//
import Parse
import Bolts
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var isGrantedNotificationAccess:Bool = false
    var window: UIWindow?
    var activityModel:ActivityModel!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Initialize Model
        activityModel = ActivityModel(activity: "", notifyDate: Date(),postTitle:"")
        
        // Initialize Parse.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "DWxHcXjfhaf8ktS0eVuyxxEMCZmLu5rZ3dPO820a"
            $0.clientKey = "nKHdQ6r5zOsK0khIzDTbY1dBL5aUDXezNUsCTIqa"
            $0.server = "https://parseapi.back4app.com"
            $0.isLocalDatastoreEnabled = true
        }
        Parse.enableLocalDatastore()
        Parse.initialize(with: configuration)
         //get authorization for notification
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: {(granted,error) in
              self.isGrantedNotificationAccess = granted
        })
        
        
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

