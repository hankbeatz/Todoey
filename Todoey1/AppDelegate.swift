//
//  AppDelegate.swift
//  Todoey1
//
//  Created by MooMyeong on 27/08/2019.
//  Copyright © 2019 Pymco. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
          
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {
        
    }
   
    
   



}

