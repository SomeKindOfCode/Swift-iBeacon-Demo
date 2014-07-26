//
//  AppDelegate.swift
//  Beacon Demo
//
//  Created by Christopher Beloch on 19.07.14.
//  Copyright (c) 2014 Some Kind Of Code. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
                            
    var window: UIWindow?

    let locationManager = CLLocationManager()

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        // To react on the Beacon Regions, the following line is the only one that matters
        locationManager.delegate = self
        
        // This is just here to notify for entered and exited local notifications
        application.registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound,
                categories: nil
            )
        )
        
        return true
    }

    /*
        CLLocationManagerDelegate
    */
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        let enterRegion = "You entered"
        
        var notification = UILocalNotification()
        notification.alertBody = enterRegion
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        let exitRegion = "You exited"
        
        var notification = UILocalNotification()
        notification.alertBody = exitRegion
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
        
}

