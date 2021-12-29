//
//  AppDelegate.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupRouter()
        return true
    }
}
//MARK: - Router configuration
extension AppDelegate {
    private func setupRouter() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootNavigationController = UINavigationController()
        let initialRouter = MoviesListRouter()
        initialRouter.navigationController = rootNavigationController
        initialRouter.pushOnNavigationController(animation: false)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
}

