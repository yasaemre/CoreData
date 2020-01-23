//
//  AppDelegate.swift
//  BaseCoreDataExam
//
//  Created by Sophie Zhou on 9/26/17.
//  Copyright © 2017 Sophie Zhou. All rights reserved.
//

import UIKit
import CoreData
import Novagraph

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        CoreDataManager.containerName = "Relationships"
        CoreDataManager.setUpCoreDataStack()
        self.createTeams()

        let vc = TeamsViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isTranslucent = false

        self.window = UIWindow()
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }

    func createTeams() {
        let request = NSFetchRequest<Team>(entityName: "Team")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let results = try! CoreDataManager.shared.context.fetch(request)
        if results.count > 0 {
            // Don't create teams anymore, since some already exist.
            return
        }

        let teams = ["Golden State Warriors", "San Francisco Giants", "Oakland Raiders"]
        for teamName in teams {
            let team = NSEntityDescription.insertNewObject(forEntityName: "Team", into: CoreDataManager.shared.context) as! Team
            team.name = teamName
        }

        try! CoreDataManager.shared.context.save()
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

