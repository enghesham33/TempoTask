//
//  AppDelegate.swift
//  TempoTask
//
//  Created by Hesham Donia on 29/10/2021.
//

import UIKit

let API_KEY = ProcessInfo.processInfo.environment["API_KEY"]!
let BASE_URL = ProcessInfo.processInfo.environment["BASE_URL"]!

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: NewsListWireframe.createNewsListView())

        navigationController.navigationBar.isHidden = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

