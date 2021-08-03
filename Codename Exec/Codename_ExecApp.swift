//
//  Codename_ExecApp.swift
//  Codename Exec
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI
import Firebase
import UIKit


@main
struct Codename_ExecApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    @StateObject var ViewChanger = viewChanger()
    var body: some Scene {
        WindowGroup {
            MainView(ViewChanger: viewChanger())
        }
    }

}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
