//
//  studyTimerCatApp.swift
//  studyTimerCat
//
//  Created by 90309356 on 2/21/23.
//

import SwiftUI

@main
struct studyTimerCatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            //studyView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
       // let viewControllerWithYourFunction = viewControllerWithYourFunction()
      //  viewControllerWithYourFunction.sendLocation()
    }
}
