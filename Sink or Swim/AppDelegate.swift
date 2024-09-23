//
//  AppDelegate.swift
//  Sink or Swim
//
//  Created by Ayoola Olaosebikan on 9/18/24.
//

import UIKit

// The @main attribute tells Swift that this is the entry point of the app.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // This method is called when the application has finished launching.
    // It’s the entry point for any custom setup or configuration at app launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: - UISceneSession Lifecycle

    // This method is called when a new scene session is being created.
    // The scene session is used for managing multiple instances of the app's user interface (multi-window support).
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Return the configuration to use for the new scene (usually named "Default Configuration").
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // This method is called when the user discards a scene session.
    // It provides a place to release resources or clean up any state associated with the discarded scene.
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Handle any cleanup after a scene has been discarded.
        // If the app is not running when a scene is discarded, this method will be called when the app is launched again.
    }
}
