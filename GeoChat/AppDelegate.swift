//
//  Listen to events from system.
//  eg finish launching or terminate
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Firebase config
        FirebaseApp.configure()
        
//         reinit db
//        let myDatabase = Database.database().reference()
//        myDatabase.setValue("new data")
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is terminating
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // when app is about to move from active to inactive state eg phone call
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // shared resources
        // If app supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any paused tasks while app inactive
    }




}

